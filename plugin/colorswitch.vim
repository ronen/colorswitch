"
" colorswitch.vim – Auto theme switcher for MacVim based on system appearance
"
" https://github.com/YOUR_USERNAME/colorswitch.vim

if !has('gui_running') || !has('autocmd') || !has('timers')
  finish
endif

if !exists('g:colorswitch_light') || !exists('g:colorswitch_dark')
  echom "[colorswitch] Please set g:colorswitch_light and g:colorswitch_dark in your .gvimrc"
  finish
endif

let s:current_theme = ''

function! s:IsDarkMode()
  let l:appearance = system('defaults read -g AppleInterfaceStyle 2>/dev/null')
  return v:shell_error == 0 && l:appearance =~? 'Dark'
endfunction

function! s:ApplyTheme()
  if s:IsDarkMode()
    let l:new_theme = g:colorswitch_dark
  else
    let l:new_theme = g:colorswitch_light
  endif

  if s:current_theme !=# l:new_theme
    let s:current_theme = l:new_theme
    execute 'colorscheme' l:new_theme
    syntax reset
  endif
endfunction

" Delay theme application until after user config is loaded
autocmd VimEnter * call s:ApplyTheme()

" React to macOS appearance change
augroup ColorSwitchAppearance
  autocmd!
  autocmd OSAppearanceChanged * call s:ApplyTheme()
augroup END
