DEPLOY_LIST		:= DEPLOY_LIST
DOTFILES_DIR	:= $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES		:= $(shell cat $(DEPLOY_LIST))
.DEFAULT_GOAL 	:= help

all:

list: 	## Show the dotfiles to deploy.
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy: ## Create symlink to the dotfiles.
	@echo "[*] Deploy the dotfiles to your home directory."
	@$(foreach val, $(DOTFILES), $(DOTFILES_DIR)/etc/deploy.sh $(DOTFILES_DIR)/$(val) $(HOME)/$(val);)
	@echo "[*] Deployment completed."

clean: 	## Remove the symlinks.
	@echo "[*] Remove symlinks in your home directory."
	@$(foreach val, $(DOTFILES), $(DOTFILES_DIR)/etc/clean.sh $(HOME)/$(val);)
	@echo "[*] Remove completed."

init:	## Initialize to deploy the dotfiles.
	@echo "[*] Initialzation started."
	@echo "[+] Initialize submodules."
	git submodule update -i
	@echo "[+] Create directories to deploy the dotfiles."
	@$(foreach val, $(DOTFILES), $(DOTFILES_DIR)/etc/init.sh $(HOME)/$(val);)
	@echo "[*] Initialzation completed."

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

