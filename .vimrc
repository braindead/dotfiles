source /usr/share/vim/vim80/vimrc_example.vim

call pathogen#infect() 
call pathogen#helptags()

filetype plugin indent on

colorscheme slate
syntax on

set nocompatible
set history=1000
set isk+=_,$,@,%,#,-
set sw=4 ts=4 sts=4 expandtab
set splitbelow
set wildmenu
set cmdheight=1
set nu
set mouse=a
set showmatch
set nohlsearch
set incsearch
set ignorecase
set laststatus=2
set undofile
set undodir=/tmp
set autowrite
set visualbell

set clipboard=unnamed

set backupdir=~/.backup
set backup

set cpt=.,w,b,u,U,t,i,kspell

map <F10> :!NODE_ENV=development node app.js<CR>

fu! SaveSess()
	let session_file = getcwd() . '/.session.vim' 
	if v:this_session == session_file && filereadable(session_file)
		execute 'mksession! ' . session_file 
	endif
endfunction

fu! RestoreSess()
	if filereadable(getcwd() . '/.session.vim')
		execute 'so ' . getcwd() . '/.session.vim'
	endif
endfunction

autocmd VimLeave * call SaveSess()

let g:coffee_make_options = '--bare'
autocmd BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw!
"au BufWritePost *.coffee make! | cwindow | redraw!

autocmd BufWritePost *.scss silent execute "!compass compile -e production %" | redraw!

"nnoremap * /<C-R>=expand('<cWORD>')<CR><CR>
"nnoremap # ?<C-R>=expand('<cWORD>')<CR><CR>
