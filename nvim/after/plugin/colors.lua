function UseColorScheme(color)
  -- colorscheme everforest
  -- color = color or "everforest"
  -- vim.g.everforest_background = "hard"

  -- colorscheme tokyonight
  -- color = color or "tokyonight"

  -- colorscheme nordic
  color = color or "nordic"

  -- colorsheme catppuccion
  -- color = color or "catppuccin"

	vim.opt.termguicolors = true
	vim.cmd.colorscheme(color)
end

UseColorScheme()
