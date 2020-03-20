build: ## Build docs locally
	mkdocs build --clean

serve: ## Serve live version of your docs
	mkdocs serve

all: build
