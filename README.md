# lua-plainstart.nvim
This is a nvim plugin completely written from scratch

## Sources

- [How to write neovim plugins in Lua](https://www.2n.pl/blog/how-to-write-neovim-plugins-in-lua)
- [How to make UI for neovim plugins in Lua](https://www.2n.pl/blog/how-to-make-ui-for-neovim-plugins-in-lua)
- __[nanotee/nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide)__
- [Neovim writing LUA plugins ](https://sbulav.github.io/vim/neovim-telescope-github/)
- [Getting started using Lua in Neovim](https://opensourcelibs.com/lib/nvim-lua-guide)
- [From init.vim to init.lua](https://teukka.tech/luanvim.html)
- [Using LibUV in Neovim](https://teukka.tech/vimloop.html)
- [Writing NeoVim Plugins Part 1 / 3](https://www.youtube.com/watch?v=9L4sW047oow&list=PLm323Lc7iSW_3vwe-6mFo62arDfU5e8Gy&index=2) 
- [NeoVim Plugin 2 / 3 - Windows and Buffers!!!](https://www.youtube.com/watch?v=0BEvxe6eaj4&list=PLm323Lc7iSW_3vwe-6mFo62arDfU5e8Gy&index=2) 

## The Primeagen way

### Getting your options

When you want to do something and you can remember the command you can use`:h nvim`. With that you will see a list of every function nvim has to over.

When you want you want to use those commands you have to prefix those with `vim.api.`. Others can be accessed via `vim.fn.`

When you have variables defined in vimscript like `let g:your_value = 42`, you can access this ariable with `vim.g["value"]`. Remember when you make changes to a vimscript you have to source this file afterwards with `:so %`

## Setting up the structure of the project (another possibility)

A good starting point are the standard git files. Besides that we need at least two files `lua/pluginname.lua` and `plugin/pluginname.vim`. It all could be put in one file but it seems to better to split lua from vimscript.

In the `plugin/pluginname.vim` following elements making sense:

This is the first line and prevents that the plugin is loaded twice.

```vimscript
if exists('g:loaded_pluginname') | finish | endif
```

After that we manage the user coptions.

```vimscript
let s:save_cpo = &cpo " save user option
set cpo&vim " reset them to defaults
```

Then we can give the command to run the plugin

```vimscript
command! Pluginname lua require'pluginname'.pluginname()
```

After the command has been run we can restore the coptions for the user.

```vimscript
let &cpo = s:save_cpo
unlet s:save_cpo
```

At last we set the plugin as loaded.

```vimscript
let g:loaded_pluginname = 1
```

Since plugins writen in lua we should communicate that.

```vimscript
if !has('nvim')
    echohl Error
    echom "Sorry this plugin only works with versions of neovim that support lua"
    echohl clear
    finish
endif
```

