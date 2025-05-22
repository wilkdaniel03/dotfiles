vim.opt['number'] = true
vim.opt['relativenumber'] = true
vim.opt['swapfile'] = false
vim.opt['tabstop'] = 4
vim.opt['shiftwidth'] = 4
vim.opt['expandtab'] = true

local opts = { silent = true, noremap = true }
vim.keymap.set('n','<SPACE>w','<CMD>w<CR>',opts)
vim.keymap.set('n','<SPACE>q','<CMD>q!<CR>',opts)
vim.keymap.set('n','<SPACE>e','<CMD>Explore<CR>',opts)
vim.keymap.set('i','jk','<ESC>',opts)

require('nvim-treesitter.configs').setup {
    auto_install = true,

    highlight = {
        enable = true
    }
}

vim.cmd('colorscheme catppuccin-mocha')

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
    use 'catppuccin/nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
