GH_BIN ?= gh
TEMPLATRON_BIN ?= tt

all: help ## alias for make help

help: ## show all the targets and what they do
	@awk 'BEGIN {FS = ":.*?## "}; /^.+: .*?## / && !/awk/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' ${MAKEFILE_LIST} | sort

debug-%: ## debug-SOMETHING shows the value of the SOMETHING variable
	@echo $(*) = $($(*))

add-repo: ## create a new repo using gh cli, then onboard it
	read -p "repo name: homelab-" repo && \
	$(GH_BIN) repo create charlesthomas/homelab-$${repo} --license mit --public && \
	$(TEMPLATRON_BIN) --no-autoclean --clone-root ${HOME}/code/charlesthomas charlesthomas/homelab-template onboard charlesthomas/homelab-$${repo}

new-repo: add-repo ## new-repo is an alias for add-repo b/c i can't remember which is correct

update-repo: ## re-onboard an existing repo
	read -p "repo name: homelab-" repo && \
	$(TEMPLATRON_BIN) --no-autoclean --clone-root ${HOME}/code/charlesthomas charlesthomas/homelab-template onboard charlesthomas/homelab-$${repo}
