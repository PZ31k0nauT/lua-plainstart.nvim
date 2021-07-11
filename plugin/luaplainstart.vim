if exists('g:loaded_luaplainstart') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

if !has('nvim')
    echohl Error
    echom "Sorry this plugin only works with versions of neovim that support lua"
    echohl clear
    finish
endif

command! luaplainstart lua require'luaplainstart'.luaplainstart()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_luaplainstart = 1
