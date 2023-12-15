local builtin = require("telescope.builtin")

-- Method builtin.find_files is of neovim
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
