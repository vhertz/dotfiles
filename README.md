# dotfiles

This repository contains my personal dotfiles and scripts to manage them.

## Usage

1. Write your own `DEPLOY_LIST`.
2. Run `./manager.sh init` to create necessary directories to deploy the dotfiles.
3. Run `./manager.sh deploy` to deploy the dotfiles by creating symlinks in your home directory.

### `DEPLOY_LIST`

`DEPLOY_LIST` is a file that lists all the dotfiles you want to deploy. Each line should contain the source file path (relative to the repository root).

`DEPLOY_LIST.all` includes all the dotfiles managed in this repository. You can create `DEPLOY_LIST` by copying and modifying this file.

### `manager.sh`

`manager.sh` is a script to help you manage and deploy your dotfiles easily. The following commands are available:

```sh
./manager.sh list    # Show the list of dotfiles to deploy
./manager.sh init    # Initialize directories for deployment
./manager.sh deploy  # Create symlinks to dotfiles in your home directory
./manager.sh clean   # Remove symlinks from your home directory
./manager.sh help    # Display help message
```
