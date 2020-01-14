# accent.vim
A simple vim colourscheme with a configurable accent colour.

![](https://raw.githubusercontent.com/Alligator/accent.vim/images/accent.gif)

## installation
Using vim-plug:
```vim
Plug 'alligator/accent.vim'
```
Other package managers may vary.

## change the accent colour
Set `g:accent_colour` or `g:accent_color` to one of the possible values:

```vim
" one of:
let g:accent_colour = 'yellow' " the default
let g:accent_colour = 'red'
let g:accent_colour = 'green'
let g:accent_colour = 'blue'
let g:accent_colour = 'magenta'
let g:accent_colour = 'cyan'

" then
colorscheme accent
```

a neat thing to do might be change your accent colour based on the working directory when you start vim:
```vim
if getcwd() =~ 'code/my-cool-project'
  let g:accent_colour = 'cyan'
  colo accent
endif
```
