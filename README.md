# vim-textobj-bettertag

[![vim-themis](https://github.com/Omochice/vim-textobj-bettertag/actions/workflows/ci.yml/badge.svg)](https://github.com/Omochice/vim-textobj-bettertag/actions/workflows/ci.yml)

This plugin provides a mapping: `<Plug>(textobj-bettertag-i)`.

If you place the cursor on `|` position.

```html
<div>
| some text
</div>
```

When you run `dit` you will get the following:

```html
<div>|</div>
```

If you map this plugin as `onoremap it <Plug>(textobj-bettertag-i)`, you will get:

```html
<div>
|</div>
```

## Coverage

Currently, there are tested on Linux only.

|       |vim|nvim|
|-------|---|----|
|stable |[![coverage-vim-stable](https://omochice.github.io/vim-textobj-bettertag/badge-Linux-vim-stable.svg)](https://github.com/Omochice/vim-textobj-bettertag/actions/workflows/ci.yml)|[![coverage-nvim-stable](https://omochice.github.io/vim-textobj-bettertag/badge-Linux-neovim-stable.svg)](https://github.com/Omochice/vim-textobj-bettertag/actions/workflows/ci.yml)|
|nightly|[![coverage-vim-nightly](https://omochice.github.io/vim-textobj-bettertag/badge-Linux-vim-nightly.svg)](https://github.com/Omochice/vim-textobj-bettertag/actions/workflows/ci.yml)|[![coverage-nvim-nightly](https://omochice.github.io/vim-textobj-bettertag/badge-Linux-neovim-nightly.svg)](https://github.com/Omochice/vim-textobj-bettertag/actions/workflows/ci.yml)|

## License

[zlib](./LICENSE)
