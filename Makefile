black: ## Black format only python files to line length 100
	black --line-length=100 ./
	make clean

clean: ## Remove caches, checkpoints, and distribution artifacts
	find . -type f -name ".DS_Store" | xargs rm -f
	find . -type d \( -name ".ipynb_checkpoints" -o -name "__pycache__" -o -name ".pytest_cache" \) | xargs rm -rf
	rm -rf dist/ build/ *.egg-info

build-notebook-docs: ## Rebuild Jupyter notebook docs by converting it to standalone HTML and ZIP
	rm -f docs/quickstart.html docs/quickstart.zip
	jupyter nbconvert --to html notebooks/quickstart.ipynb --output-dir docs
	cd notebooks && zip -r ../docs/quickstart.zip quickstart.ipynb data

deploy-docs: ## Deploy docs using mkdocs to GitHub Pages
	mkdocs gh-deploy --clean
