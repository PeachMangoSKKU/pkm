##@ General

help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Preview

backlinks: ## Generate the list of backlinks for Hugo to parse
	hugo-obsidian -input=content -output=data

preview: backlinks ## Run Hugo to preview your site locally at http://localhost:1313/
	hugo server

##@ Publish

