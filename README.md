# accent.vim
A vim colourscheme with a configurable accent colour. It can help you quickly tell apart different vim sessions at a glance.

It supports the GUI and 256 colour terminals.

![](https://raw.githubusercontent.com/Alligator/accent.vim/images/accent.gif)

## installing
Using vim-plug:
```vim
Plug 'alligator/accent.vim'
```
Other package managers may vary.

## options
```vim
" g:accent_color or g:accent_colour changes the accent colour.
" one of
let g:accent_colour = 'yellow' " the default
let g:accent_colour = 'orange'
let g:accent_colour = 'red'
let g:accent_colour = 'green'
let g:accent_colour = 'blue'
let g:accent_colour = 'magenta'
let g:accent_colour = 'cyan'

" g:accent_darken makes the background and some text colours darker.
let g:accent_darken = 0 " the default
let g:accent_darken = 1

" g:accent_invert_status inverts the colour of the status line text.
let g:accent_invert_status = 0 " the default
let g:accent_invert_status = 1

" after changing settings, you'll need to re-apply the colorscheme
colorscheme accent
```

a neat thing to do is change the accent colour based on the working directory when vim starts:
```vim
if getcwd() =~ 'code/my-cool-project'
  let g:accent_colour = 'cyan'
  colo accent
endif
```
