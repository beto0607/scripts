#!/usr/bin/env bash

# Set the disk device to monitor (e.g., nvme0n1, sda)
DISK="nvme0n1"
STATE_FILE="/tmp/waybar_disk_stats_${DISK}"

format_speed() {
  local bytes=$1
  if ((bytes >= 1073741824)); then
    awk -v b="$bytes" 'BEGIN {printf "%.1f GB/s", b / 1073741824}'
  elif ((bytes >= 1048576)); then
    awk -v b="$bytes" 'BEGIN {printf "%.1f MB/s", b / 1048576}'
  elif ((bytes >= 1024)); then
    awk -v b="$bytes" 'BEGIN {printf "%.1f KB/s", b / 1024}'
  else
    printf "%d B/s" "$bytes"
  fi
}

# /proc/diskstats field 6 = sectors read, field 10 = sectors written (512 bytes/sector)
read -r _ _ _ _ _ sectors_read _ _ _ sectors_written _ < <(grep -w "$DISK" /proc/diskstats)
now=$(date +%s%N)

if [[ -f "$STATE_FILE" ]]; then
  read -r prev_time prev_read prev_written <"$STATE_FILE"

  elapsed_ns=$((now - prev_time))
  if ((elapsed_ns > 0)); then
    read_bytes=$(((sectors_read - prev_read) * 512))
    written_bytes=$(((sectors_written - prev_written) * 512))

    read_rate=$((read_bytes * 1000000000 / elapsed_ns))
    write_rate=$((written_bytes * 1000000000 / elapsed_ns))

    r_str=$(format_speed "$read_rate")
    w_str=$(format_speed "$write_rate")

    echo "{\"text\": \"󰋊  ▲ ${w_str}  ▼ ${r_str}\", \"tooltip\": \"Device: /dev/${DISK}\\nRead: ${r_str}\\nWrite: ${w_str}\"}"
  fi
else
  echo "{\"text\": \"󰋊  calculating...\"}"
fi

echo "$now $sectors_read $sectors_written" >"$STATE_FILE"
