GH_BIN ?= gh
TEMPLATRON_BIN ?= tt

all: help ## alias for make help

help: ## show all the targets and what they do
	@awk 'BEGIN {FS = ":.*?## "}; /^.+: .*?## / && !/awk/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' ${MAKEFILE_LIST} | sort

debug-%: ## debug-SOMETHING shows the value of the SOMETHING variable
	@echo $(*) = $($(*))

add-repo: ## create a new repo using gh cli, then onboard it
	bin/add-repo.bash

fix-repo: ## run templatron fix
	read -p "repo name: homelab-" repo && \
	read -p "existing branch: " branch && \
	$(TEMPLATRON_BIN) --no-autoclean --clone-root ${HOME}/code/charlesthomas \
	charlesthomas/homelab-template fix charlesthomas/homelab-$${repo} $${branch}

new-repo: add-repo ## new-repo is an alias for add-repo b/c i can't remember which is correct

check-templatron:
	@command -v templatron >/dev/null || { echo "templatron is not installed (not found in \$$PATH)"; exit 1; }

onboard-repo: check-templatron add-repo ## run templatron onboard
	bin/onboard-repo.bash

repo-settings: ## apply standard GitHub settings to an existing repo
	read -p "repo name: homelab-" repo && \
	bin/repo-settings.bash homelab-$${repo}

update-repo: ## re-onboard an existing repo
	read -p "repo name: homelab-" repo && \
	$(TEMPLATRON_BIN) --no-autoclean --clone-root ${HOME}/code/charlesthomas charlesthomas/homelab-template onboard charlesthomas/homelab-$${repo}
