set expandtab      "allows changes of tab table
set tabstop=4      "sets tabs == 4 spaces
set shiftwidth=4
autocmd FileType make setlocal noexpandtab "does NOT use spaces in MakeFiles
set softtabstop=4 " makes backspace treat tabs like a tab and NOT spaces
:filetype plugin indent on
:syntax on
set autoindent
set mouse=a
