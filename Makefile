black: ## Black format only python files to line length 100
	black --line-length=100 ./
	make clean

clean: ## Remove caches, checkpoints, and distribution artifacts
	find . -type f -name ".DS_Store" | xargs rm -f
	find . -type d \( -name ".ipynb_checkpoints" -o -name "__pycache__" -o -name ".pytest_cache" \) | xargs rm -rf
	rm -rf dist/ build/ *.egg-info
