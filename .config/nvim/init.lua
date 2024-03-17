local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath, })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup
{
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function () 
            local configs = require('nvim-treesitter.configs')

            configs.setup({
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
     },


    { 'm00qek/baleia.nvim', tag = 'v1.3.0' },

    'lukas-reineke/indent-blankline.nvim',
    'nvim-telescope/telescope.nvim',
    'andreasvc/vim-256noir',
    'luisiacc/gruvbox-baby',
    'voldikss/vim-floaterm',
    'nvim-lua/plenary.nvim',
    'windwp/nvim-autopairs',
    'sam4llis/nvim-tundra',
    'sheerun/vim-polyglot',
    'lambdalisue/suda.vim',
    'etdev/vim-hexcolor',
    'tpope/vim-fugitive',
    'rust-lang/rust.vim',
    'preservim/nerdtree',
    'peterhoeg/vim-qml',
    'rainglow/vim',
}


require('nvim-treesitter.configs').setup(
{
     highlight = 
     {
        enable = true,
        additional_vim_regex_highlighting = true,
     }
})

require('telescope').setup
{ 
    defaults = 
    { 
        file_ignore_patterns = 
        {
            'node_modules/', 
            
            'vendor/',
            'Vendor/',
            
            'bin/', 
            'bin-int/', 
            
            'build/',

            'Cargo.lock',
        }
    }
}

require('nvim-autopairs').setup()

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.showcmd = false
vim.opt.laststatus = 0
vim.opt.relativenumber = true
vim.opt.linebreak = true
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.guicursor = ''
vim.opt.rulerformat = '(%l:%c%V)'
vim.opt.smartindent = true
vim.opt.fillchars.vert = ' '
vim.opt.fillchars.eob = ' '
vim.opt.background = 'dark'
vim.opt.clipboard = 'unnamedplus'

vim.g.mapleader = ' '

vim.g.NERDTreeMinimalUI = true
vim.g.NERDTreeWinPos = 'right'
vim.g.NERDTreeWinSize = 20

vim.g.floaterm_borderchars = '        '
vim.g.floaterm_position = 'right'
vim.g.floaterm_autoinsert = true
vim.g.floaterm_autoclose = false
vim.g.floaterm_height = 1.0
vim.g.floaterm_title = ''

vim.g.rust_clip_command = 'xclip -selection clipboard'
vim.g.cargo_shell_command_runner = 'FloatermNew'

vim.api.nvim_set_keymap('n', '<F12>', ':FloatermNew<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', ':FloatermKill<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-e>', ':NERDTreeToggle<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeFocus<CR>',   { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>ff', '<CMD>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<CMD>Telescope live_grep<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<CMD>Telescope buffers<CR>',    { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<CMD>Telescope help_tags<CR>',  { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>tn', '<CMD>tabn<CR>',     { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tp', '<CMD>tabp<CR>',     { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tt', '<CMD>tabnew<CR>',   { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tl', '<CMD>tablast<CR>',  { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tf', '<CMD>tabfirst<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-h>', ':vertical resize -3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':vertical resize +3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':resize -3<CR>',          { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':resize +3<CR>',          { noremap = true })

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('v', ';', ':', { noremap = true })

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true  })
vim.api.nvim_set_keymap('', 'Q', '<Nop>',            { noremap = false })

vim.cmd([[
    aunmenu PopUp.How-to\ disable\ mouse
    aunmenu PopUp.-1-

    au BufReadPost,BufNewFile *.dart set sw=2 ts=2
    au BufReadPost,BufNewFile *.md   set linebreak wrap

    au BufReadPost,BufNewFile *.csx  set ft=cs
    au BufReadPost,BufNewFile *.asm  set ft=nasm
    au BufReadPost,BufNewFile *.s    set ft=nasm
    au BufReadPost,BufNewFile *.hpp  set ft=cpp

    au BufReadPost,BufNewFile *.rs nnoremap <F5>  :Crun<CR>
    au BufReadPost,BufNewFile *.rs nnoremap <F10> :Cbuild<CR>
    au BufReadPost,BufNewFile *.rs nnoremap <F7>  :RustFmt<CR>

    au BufReadPost,BufNewFile *.go nnoremap <F5>  :FloatermNew go run .<CR>
    au BufReadPost,BufNewFile *.go nnoremap <F10> :FloatermNew go build .<CR>

    au BufReadPost,BufNewFile *.c nnoremap <F5>  :FloatermNew make run<CR>
    au BufReadPost,BufNewFile *.c nnoremap <F10> :FloatermNew make build<CR>

    syntax on
    colorscheme 256_noir

    hi VertSplit guifg=#000000 guibg=NONE

    hi LineNr         guibg=NONE guifg=#333333
    hi Normal         guibg=NONE
    hi Visual         guibg=#212121
    hi NonText        guibg=NONE
    hi CursorLine     guibg=#0A0A0A
    hi StatusLine     guibg=#000000
    hi SignColumn     guibg=#000000 guifg=#000000
    hi EndOfBuffer    guibg=NONE

    hi Comment gui=italic
    hi Macro   gui=bold

    hi IndentBlankLineChar guifg=#333333
    hi FloatermBorder      guibg=#0A0A0A

    command W w
    command Q q
    command WQ wq
    command Wq wq
]])

