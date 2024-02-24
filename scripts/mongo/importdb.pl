#!/usr/bin/perl

use strict;
use warnings;

if ($#ARGV + 1 < 2 ) {
	print "You must provide the database name in the first paramenter.\n";
	exit;
}

my $dbName = shift @ARGV;
my $folder = shift @ARGV;

opendir my $dir, $folder or die "$0: opendir: $!";

while(defined(my $item = readdir $dir)){
    next if -d "$folder/$item"; 
    $item =~ /^(.*)\.(.*)\.json$/ ;
    next unless $1 eq $dbName;
    my $collection = $2;
    my $command = "mongoimport --db $dbName -c $collection --file $folder/$item";
    system($command);
}
print("Finished\n");

