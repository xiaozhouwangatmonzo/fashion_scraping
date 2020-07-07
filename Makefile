$(CURR_DIR)/.python-versions: $(CURR_DIR)/requirements.txt
	pyenv virtualenv --force 3.7.1 "pyenv.$(CURR_DIR)"; \
	pyenv local pyenv.$(CURR_DIR); \
	pip install --upgrade pip setuptools; \
	pip install -r requirements.txt

venv: $(CURR_DIR)/.python-versions


deploy:
	gcloud functions deploy scrape_website --runtime python37 --trigger-http --timeout=360s --quiet --allow-unauthenticated