setup:
	# Create python virtualenv & source it
	python3 -m venv ~/.django_poll
	@echo "Created python virtualenv. You will need to activate it using:"
	@echo "source ~/.django_poll/bin/activate"

install:
	# This should be run from inside a virtualenv
	# Install dependencies in requirements.txt
	pip3 install --no-cache-dir --upgrade pip && pip3 install --no-cache-dir -r requirements.txt

test:
	# This should be run from inside a virtualenv
	#python manage.py test polls

lint:
	# This should be run from inside a virtualenv
	# This is linter for Dockerfiles - https://github.com/hadolint/hadolint
	hadolint Dockerfile
	# This is linter for Python source code - https://www.pylint.org/
	pylint --disable=R,C,W0613 --generated-members=objects,DoesNotExist poll_site/polls

all: install lint test
