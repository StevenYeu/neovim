local flash = require("flash")
local wk = require("which-key")

-- Start Flash
vim.keymap.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end)
-- Flash Treesitter
vim.keymap.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end)
-- Remote Flash
vim.keymap.set({ "o" }, "r", function()
	flash.remote()
end)

--- Flash Treesitter Search
vim.keymap.set({ "x", "o" }, "R", function()
	flash.treesitter_search()
end)

-- Toogle Flash Searcg
vim.keymap.set({ "c" }, "<c-s>", function()
	flash.toggle()
end)

wk.register({
	["s"] = { "Flash Search" },
	["S"] = { "Flash Treesitter" },
}, { mode = { "n", "x", "o" } })
