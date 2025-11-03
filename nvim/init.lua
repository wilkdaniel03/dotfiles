opts = {
	number = true,
	relativenumber = true,
	tabstop = 4,
	shiftwidth = 4,
	scrolloff = 8
}

for k,v in pairs(opts) do
	vim.opt[k] = v
end

require'nvim-treesitter.configs'.setup {
	auto_install = true,
	highlight = {
		enable = true,
	},
}

require'nvim-autopairs'.setup{}
require'oil'.setup{
	view_options = {
		show_hidden = true
	}
}
require'lsp_lines'.setup()

vim.diagnostic.config({
  virtual_text = true
})

vim.cmd("colorscheme carbonfox")

vim.keymap.set('i','jk','<ESC>')
vim.keymap.set('n','<space>w','<CMD>w<CR>')
vim.keymap.set('n','<space>q','<CMD>q!<CR>')
vim.keymap.set('n','<space>e','<CMD>Oil<CR>')
vim.keymap.set('n','<s-t>','<CMD>tabnew<CR>')
vim.keymap.set('n','<s-n>','<CMD>tabnext<CR>')
vim.keymap.set('n','<s-m>','<CMD>tabprevious<CR>')

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'windwp/nvim-autopairs'
	use 'EdenEast/nightfox.nvim'
	use 'stevearc/oil.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'
	use 'ErichDonGubler/lsp_lines.nvim'
	use 'numToStr/Comment.nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
