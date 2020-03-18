set runtimepath^=~/.vim runtimepath+=~/.vim/after      
let &packpath = &runtimepath

function! ShouldSetTermGuiColours()
  if $TERM == 'xterm-256color' || $TERM=='screen'
	return 1
  endif
endfunction

let w:restore={}

function! ToggleFullscreen()
  " TODO: Rewrite using winrestcmd()
  if w:restore == {} 
	let w:restore=winsaveview()

	vertical res 1000
	res 1000
  else
    call winrestview(w:restore)
	let w:restore={}
  endif
endfunction 


let &termguicolors=ShouldSetTermGuiColours()
set nocompatible              " be iMproved, required
filetype off                  " required
set wildmenu
set ignorecase
set smartcase

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')



" Include matchit plugin to make navigating HTML tags easier
":source /usr/local/share/vim/vim80/macros/matchit.vim

" vim-jsx settings
let g:jsx_ext_required = 0

" JavaScript support
Plug 'herringtondarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
" Typescript syntax
Plug 'leafgarland/typescript-vim'
" General completion plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Utilities
Plug 'xolox/vim-misc'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimproc.vim'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-fugitive'
" Colour schemes
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'icymind/NeoSolarized'
" Formatting and general syntax highlighting 
Plug 'prettier/vim-prettier'
Plug 'scrooloose/syntastic'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jimmyhchan/dustjs.vim'
Plug 'eparreno/vim-l9'
Plug 'mrk21/yaml-vim'
" COC and extensions
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
" JS Language server
Plug 'tbodt/js-langserver', {'do': 'yarn install --frozen-lockfile'}
" Elm langugage server
Plug 'elm-tooling/elm-language-server', {'do': 'npm install; npm run compile; npm link'}
" End COC
" Elm specific
Plug 'andys8/vim-elm-syntax'
Plug 'kbsymanz/ctags-elm'
" Plugin 'Zaptic/elm-vim'
" Kotlin plugin also, configure language server with https://github.com/fwcd/kotlin-language-server/blob/master/EDITORS.md
Plug 'udalov/kotlin-vim'
" Distraction free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimoutliner/vimoutliner'
" .editorconfig support
Plug 'editorconfig/editorconfig-vim'
" Plugin 'janko/vim-test'
" Currently unused
" Plug 'udalov/kotlin-vim'
" Plug 'edkolev/tmuxline.vim'
" Plug 'LucHermitte/lh-vim-lib'
" Plug 'LucHermitte/local_vimrc'
" Plug 'lifepillar/vim-solarized8'
" Plug 'w0rp/ale'
" Plug 'altercation/vim-colors-solarized'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Plug 'janko/vim-test'
" plug on GitHub repo
" plug from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
" Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plug 'ternjs/tern_for_vim'
" Plug 'LucHermitte/local_vimrc'
" Plug 'mileszs/ack.vim'
" TS Support
" Plug 'Quramy/tsuquyomi'
" Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()


" Set the gutter to show the current line number, not zero for the relative line numbers set below.
set nu
" Set relative line numbers 
set rnu
" Set fold column so we can tell what is folded
set foldcolumn=2

" vim-javascript settings
let g:javascript_enable_domhtmlcss = 1

" Tmuxline (Configures Tmux's statusbar to match Vim's)
" let g:tmuxline_preset = 'full'

" :highlight TrailingWhitespace ctermbg=darkred guibg=darkred
" :let w:m2=matchadd('TrailingWhitespace', '\s\+$\| \+\ze\t')

" Colour settings
syntax on
" set rtp+=/usr/local/Cellar/fzf/0.9.2


" Cursor settings
" if &term =~ "xterm\\|rxvt"
" use an orange cursor in insert mode
" let &t_SI = "\<Esc>]12;orange\x7"
" use a red cursor otherwise
" let &t_EI = "\<Esc>]12;red\x7"
" silent !echo -ne "\033]12;red\007"
" reset cursor when vim exits
" autocmd VimLeave * silent !echo -ne "\033]112\007"
" use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
" endif

set ts=4
set softtabstop=2
set shiftwidth=2
set laststatus=2
set statusline=%F

" undotree config
nnoremap <F5> :UndotreeToggle<cr>

" Colourscheme
set background=dark
if &termguicolors
  colorscheme quantum
  let g:airline_theme='quantum'
else
  colorscheme NeoSolarized
endif

let g:airline_section_a=airline#section#create(['mode', 'crypt', 'paste', 'iminsert'])
" let g:airline_section_y=''
" Powerline mode stuff
" let g:airline_mode_map = {
" 	  \ '__'     : '-',
" 	  \ 'c'      : 'C',
" 	  \ 'i'      : 'I',
" 	  \ 'ic'     : 'I',
" 	  \ 'ix'     : 'I',
" 	  \ 'n'      : 'N',
" 	  \ 'multi'  : 'M',
" 	  \ 'ni'     : 'N',
" 	  \ 'no'     : 'N',
" 	  \ 'R'      : 'R',
" 	  \ 'Rv'     : 'R',
" 	  \ 's'      : 'S',
" 	  \ 'S'      : 'S',
" 	  \ ''     : 'S',
" 	  \ 't'      : 'T',
" 	  \ 'v'      : 'V',
" 	  \ 'V'      : 'V',
" 	  \ ''     : 'V',
" 	  \ }

" Powerline font stuff
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" dust settings for surround
let g:surround_{char2nr('d')} = "{\r}"

" Auto indent stuff
" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Autocomplete stuff
" Set autocomplete to complete longest match rather than selecting first match
set completeopt=longest,menuone
" The Enter key will simply select the highlighted menu item, just as <C-Y>
" does
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" In the next mappings, the first will make <C-N> work the way it normally
" does; however, when the menu appears, the <Down> key will be simulated. What
" this accomplishes is it keeps a menu item always highlighted. This way you
" can keep typing characters to narrow the matches, and the nearest match will
" be selected so that you can hit Enter at any time to insert it. In the above
" mappings, the second one is a little more exotic: it simulates <C-X><C-O> to
" bring up the omni completion menu, then it simulates <C-N><C-P> to remove
" the longest common text, and finally it simulates <Down> again to keep a
" match highlighted.

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
	  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
	  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" To allow access to the Tern menu items we need to enable a menu to appear
" from  https://unix.stackexchange.com/questions/43526/is-it-possible-to-create-and-use-menus-in-terminal-based-vim
set wildcharm=<C-Z>
set wildmode=longest:full,full
map <F4> :emenu <C-Z>Tern.<C-Z>

" silver searcher
let g:ackprg = 'ag --vimgrep'
let g:grepprg = 'rg --vimgrep'

" Prettier
" let g:prettier#exec_cmd_path = "./node_modules/.bin/prettier"

" Tabline
" set tabline=%!MyTabLine()

" Denite.nvim
" call denite#custom#map('normal', '<C-p>', '<denite:file>', 'noremap')
" nnoremap <C-p> :Denite file/rec<CR>
" nnoremap <C-l> :Denite line -auto-preview<CR>
"
" call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
" call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>', 'noremap')
" call denite#custom#map('insert', '<C-h>', '<denite:do_action:split>', 'noremap')
"
" FZF fuzzy file finder config
nnoremap <C-p>p  :Files<CR>
nnoremap <C-p><C-p>  :Files<CR>
nnoremap <C-p>b  :Buffers<CR>
nnoremap <C-p><C-b>  :Buffers<CR>

" Add leader s to save file
nnoremap <Leader>s :w<CR>

" --column: Show column number
"  " --line-number: Show line number
"  " --no-heading: Do not show file headings in results
"  " --fixed-strings: Search term as a literal string
"  " --ignore-case: Case insensitive search
"  " --no-ignore: Do not respect .gitignore, etc...
"  " --hidden: Search hidden files and folders
"  " --follow: Follow symlinks
"  " --glob: Additional conditions for search (in this case ignore everything
"  in the .git/ folder)
"  " --color: Search color options
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!jsbundle" --glob "!**/build/**" --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

command! -bang -nargs=* Rg
	  \ call fzf#vim#grep(
	  \   'rg --glob "!.git/*" --glob "!node_modules/**" --glob "!**/build/**" --glob "!*.jsbundle*" --glob "!**/.idea/**"
	  \   --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
	  \   <bang>0 ? fzf#vim#with_preview('up:60%')
	  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
	  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
	  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" ale config
let g:ale_linters = {
	  \   'javascript': ['eslint'],
	  \   'typescript': ['tsserver', 'tslint'],
	  \   'vue': ['eslint'],
	  \	  'elm': ['elm_ls']
	  \}

let g:ale_fixers = {
	  \    'javascript': ['prettier', 'eslint'],
	  \    'typescript': ['prettier'],
	  \    'vue': ['eslint'],
	  \    'scss': ['prettier'],
	  \    'html': ['prettier']
	  \}
let g:ale_fix_on_save = 1


" YAML config
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Elm config
au! BufNewFile,BufReadPost *.elm set filetype=elm foldmethod=indent
autocmd FileType elm setlocal ts=2 sts=2 sw=2 expandtab

" Kotlin config
" Tabs and spaces! See https://stackoverflow.com/a/1878983
au! BufNewFile,BufReadPost *.{kt,kts} set filetype=kotlin 
autocmd FileType kotlin setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab textwidth=120 colorcolumn=+1 spell
autocmd FileType javascript.jsx setlocal tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab textwidth=120 colorcolumn=+1 spell

" Keybindings
:noremap \h :noh<CR>

" Fix backspace indent
set backspace=indent,eol,start

"COC stuff
let g:coc_force_debug = 1
set updatetime=300

" Better display for messages
set cmdheight=2

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : \<C-g>u\<CR>"


" Elm Keybindings
nmap <leader>r <Plug>(coc-rename)
nmap <silent> <leader>s <Plug>(coc-fix-current)
nmap <silent> <leader>S <Plug>(coc-codeaction)
nmap <silent> <leader>a <Plug>(coc-diagnostic-next)
nmap <silent> <leader>A <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>g :call CocAction('doHover')<CR>
nmap <silent> <leader>u <Plug>(coc-references)
nmap <silent> <leader>p :call CocActionAsync('format')<CR>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Turn limelight on automatically when entering goyo mode
autocmd! User GoyoEnter Limelight
autocmd User GoyoEnter set nornu
autocmd User GoyoEnter set lbr
autocmd User GoyoLeave set nolbr
autocmd! User GoyoLeave Limelight!

" COC extension config
" COC Yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" COC Explorer
nnoremap <space>e :CocCommand explorer<CR>


" Git config
nnoremap <space>g :Git<CR>

" 
" set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"
