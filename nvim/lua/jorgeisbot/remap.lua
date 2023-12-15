-- Muestra números de línea
vim.cmd('set number')

-- Deshabilita el uso del mouse
vim.cmd('set mouse=')

-- Establece el ancho mínimo para números de línea
vim.cmd('set numberwidth=1')

-- Usa el portapapeles del sistema operativo
vim.cmd('set clipboard=unnamedplus')

-- Habilita el resaltado de sintaxis
vim.cmd('syntax enable')

-- Muestra comandos incompletos
vim.cmd('set showcmd')

-- Establece la codificación de caracteres en UTF-8
vim.cmd('set encoding=utf-8')

-- Establece la cantidad de espacios para la sangría
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set expandtab')

-- Establece parpadeo del cursor
vim.cmd('set guicursor=a:blinkon1O')
vim.cmd('set guicursor+=a:blinkwait1O')

-- Muestra números de línea relativos
vim.cmd('set relativenumber')

local opts = { noremap = true, silent = true }
-- split buffer
vim.keymap.set("n", "<leader>s", ":vsplit<CR>", opts)

-- Move between windows of buffers
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Clear search highlight
vim.keymap.set("n", "<esc>", ":noh<return><esc>",  opts)

-- scroll fast
vim.keymap.set("n", "<C-j>", "10<C-e>",  opts)
vim.keymap.set("n", "<C-k>", "10<C-y>",  opts)

-- nvim Explore
vim.keymap.set("n", "<leader>e", ":Explore<CR>", opts)
