# DW's dotfiles
Machine config files used by DW. A work-in-progress repo.

## Requirements

1. Git
2. Vim
3. Make on macOS/Linux if you want the Unix install shortcut

## Scope

The portable setup in this repo currently focuses on Vim and Vim configuration.
Plugin installation is optional and not required for the base Vim config to load.

## Clone

```sh
git clone https://github.com/davidwesst/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

## Install on macOS / Linux

Use the Make target to copy the shared Vim config into the standard Unix Vim
locations and install the bundled plugin set:

```sh
make vim-install
```

This installs:

- `~/.vimrc`
- `~/.vim/`
- `~/.vim/pack/vendor/start/*`

Optional plugin update:

```sh
make vim-update
```

## Install on Windows (native Vim)

1. Clone this repo somewhere stable, for example `C:\Users\<you>\dotfiles`.
2. Copy the repo's `vim` directory to `%USERPROFILE%\vimfiles`.
3. Copy the repo's `_vimrc` to `%USERPROFILE%\_vimrc`.

This keeps the shared config in the Windows-native Vim layout:

- `%USERPROFILE%\_vimrc`
- `%USERPROFILE%\vimfiles\`

## Vim Keybindings

The shared Vim config currently adds the following custom keybindings:

- `<Ctrl-t>`: Toggle NERDTree.
- `<Enter>` in normal mode: Clear search highlighting with `:noh`.

Plugin-related behavior configured in this repo without extra custom mappings:

- `vim-airline`: Enables Powerline fonts support and the tabline extension.
- `vim-polyglot`: Installed for language pack support, with no repo-specific keybindings configured here.
- `vim-godot`: Adds Godot filetype support, including GDScript syntax highlighting.

## Notes

- The shared Vim config creates an undo directory automatically.
- Plugin-specific config is loaded only when the plugin config file exists.
- Fonts, shell setup, and language toolchains remain separate from the Vim setup.
