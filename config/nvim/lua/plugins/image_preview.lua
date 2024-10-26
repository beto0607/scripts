return {
  "adelarsq/image_preview.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("image_preview").setup()
  end,
}
