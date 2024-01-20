GH_BIN ?= gh
TEMPLATRON_BIN ?= tt

all: help ## alias for make help

help: ## show all the targets and what they do
	@awk 'BEGIN {FS = ":.*?## "}; /^.+: .*?## / && !/awk/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' ${MAKEFILE_LIST} | sort

debug-%: ## debug-SOMETHING shows the value of the SOMETHING variable
	@echo $(*) = $($(*))

add-repo: ## create a new repo using gh cli, then onboard it
	@echo this doesn\'t work yet && exit 1
	read -p "repo name: homelab-" repo && \
	$(GH_BIN) repo create charlesthomas/homelab-$${repo} --confirm --license mit --public && \
	$(TEMPLATRON_BIN) onboard 

