fun! LuaPlainstart()
  lua for k in pairs(package.loaded) do if k:match("^lua%-plainstart") then package.loaded[k] = nil end end
  lua require ("lua-plainstart").printWindowSize()
endfun

let g:value2 = 2

augroup LuaPlainstart
  autocmd!
augroup END

" if exists('g:loaded_luaplainstart') | finish | endif
" 
" let s:save_cpo = &cpo
" set cpo&vim
" 
" if !has('nvim')
"     echohl Error
"     echom 'Sorry this plugin only works with versions of neovim that support lua'
"     echohl clear
"     finish
" endif
" 
" command! Luaplainstart lua require'luaplainstart'.hello_world()
" 
" let &cpo = s:save_cpo
" unlet s:save_cpo
" 
" let g:loaded_luaplainstart = 1
