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

## Setting up the structure of the project

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
