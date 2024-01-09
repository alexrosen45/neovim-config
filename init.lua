vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = false

-- lazy.nvim configuration
local lazy = { }
function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim (plugin manager)...')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nim.git',
			'--brranch=stable',
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end

	lazy.install(lazy.path)
	vim.opt.rtp:prepend(lazy.path)

	require('lazy').setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = { }

-- Plugins
lazy.setup({
	{'folke/tokyonight.nvim'},
})

-- Apply theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
