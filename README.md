# NeoVim Config
Heavily based on theprimeagen's configuration.

## Setup
### 1. Install NeoVim
To install on my personal I use [homebrew](https://docs.brew.sh/Homebrew-on-Linux) or on remote systems by [building from source]([url](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source)) 

### 2. Create `nvim` directory and install dependencies
Create a new directory in `~/.config` called `nvim`. This is the home of all of the neovim configuration files.

The only dependencies that need to be installed are [ripgrep](https://github.com/BurntSushi/ripgrep/releases/) and [packer](https://github.com/wbthomason/packer.nvim). Follow their installation guides.
Then go ahead and clone this repo.

Use the command `nvim ~/.config/nvim` to open the `netrw` file explorer in the nvim directory. Ignore all the error messages. 
Navigate to `lua/tristan/packer.lua` and press `:so` to source the file, then `:PackerSync` to install all of the plugins in the `packer.lua` file. 
Lastly run

```
:lua ColorMyPencils()
```

To get proper text highlighting and colorscheme.
