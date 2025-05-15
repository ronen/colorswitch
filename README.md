# colorswitch.vim

Automatically switch between light and dark colorschemes in MacVim based on macOS appearance settings.

## Usage

In your `.gvimrc`:

```vim
let g:colorswitch_light = 'macvim-light-switchable'
let g:colorswitch_dark  = 'sorbet-switchable'
```

Then install with your plugin manager (e.g., vim-plug):

```vim
Plug 'ronen/colorswitch.vim'
Plug 'ronen/colorswitch-themes.vim'
```

## Requirements

- MacVim GUI (with `OSAppearanceChanged` support)
- Vim 8+ with `+timers`

## Note on Themes

Not all colorschemes behave correctly when switched at runtime. Some define highlights only at startup or use guards that prevent reapplication. For reliable switching, use themes designed with switching in mind.

You can find a pair of compatible light and dark themes in:

👉 [`ronen/colorswitch-themes.vim`](https://github.com/ronen/colorswitch-themes.vim)
