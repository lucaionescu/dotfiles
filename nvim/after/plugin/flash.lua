local flash = require('flash')

vim.keymap.set(
  { "n", "x", "o" },
  "s",
  function() flash.jump() end,
  { desc = "Flash" }
)

vim.keymap.set(
  { "n", "x", "o" },
  "S",
  function() flash.treesitter() end,
  { desc = "Flash Treesitter" }
)
