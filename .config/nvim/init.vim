set number
set showbreak=+++
set mouse=a
set clipboard+=unnamedplus
syntax enable
syntax on
" ----------------------------- PLUGIN BELOW

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" File Explorer
Plug 'scrooloose/NERDTree'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
" COC
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fugitive (Git control)
Plug 'tpope/vim-fugitive'
" Smart Tabbing
Plug 'tpope/vim-sleuth'
" Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'itchyny/lightline.vim' "Lightline statusbar
" Color Previews for CSS
Plug 'ap/vim-css-color' 

"Highlighting for Nerd Tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Catppuccin Color Theme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

"Markdown Preview"
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"Discored Rich Presence
Plug 'andweeb/presence.nvim'

"Barbar
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

"Lualine
Plug 'nvim-lualine/lualine.nvim'

"Initialize plugin system

call plug#end()

function! WinMove(key)
    let t:curwin = winnr()
endfunction

"nnoremap <silent> <C-h> :call WinMove('h')<CR>
"nnoremap <silent> <C-j> :call WinMove('j')<CR>
"nnoremap <silent> <C-k> :call WinMove('k')<CR>
"nnoremap <silent> <C-l> :call WinMove('l')<CR>

inoremap <S-Tab> <C-d>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Bar Bar config
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

" "Lualine settings
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'rose-pine',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

vim.g.rose_pine_variant = ''

vim.g.rose_pine_bold_vertical_split_line = false
vim.g.rose_pine_inactive_background = false
vim.g.rose_pine_disable_background = false
vim.g.rose_pine_disable_float_background = false
vim.g.rose_pine_disable_italics = false

local p = require('rose-pine.palette')
vim.g.rose_pine_colors = {
	punctuation = p.subtle,
	comment = p.subtle,
	hint = p.iris,
	info = p.foam,
	warn = p.gold,
	error = p.love,

	-- Or set all headings to one colour: `headings = p.text`
	headings = {
		h1 = p.iris,
		h2 = p.foam,
		h3 = p.rose,
		h4 = p.gold,
		h5 = p.pine,
		h6 = p.foam,
	},
}

EOF
"For rose pine configuration, check the rose pine neovim github.
"colorscheme catppuccin
colorscheme rose-pine

set noshowmode " Disable status since it's already included in lightline
