setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.django_poll
	@echo "Created python virtualenv. You will need to activate it using:"
	@echo "source ~/.django_poll/bin/activate"

install:
	# This should be run from inside a virtualenv
	# Install dependencies in requirements.txt
	pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

test:
	# This should be run from inside a virtualenv
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	 # This should be run from inside a virtualenv
	 # This is linter for Dockerfiles - https://github.com/hadolint/hadolint
	 hadolint Dockerfile
	 # This is linter for Python source code - https://www.pylint.org/
	 pylint --disable=R,C,W1203,W1202 app.py

all: install lint test
