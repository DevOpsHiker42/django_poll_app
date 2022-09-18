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
	export DJANGO_SETTINGS_MODULE=poll_site.dev_settings && python3 poll_site/manage.py test polls

lint:
	# This should be run from inside a virtualenv
	# This is linter for Dockerfiles - https://github.com/hadolint/hadolint
	hadolint Dockerfile
	# This is linter for Python source code - https://www.pylint.org/
	pylint --disable=R,C,W0613 --generated-members=objects,DoesNotExist poll_site/polls

deploycheck:
	# This should be run from inside a virtualenv
	python3 poll_site/manage.py check --deploy

migrations:
	# This should be run from inside a virtualenv
	python3 poll_site/manage.py makemigrations

migrationcheck:
	# This should be run from inside a virtualenv
	python3 poll_site/manage.py makemigrations --check

rundev:
	# This should be run from inside a virtualenv
	python3 poll_site/manage.py runserver --setting poll_site.dev_settings

runprod:
	# This should be run from inside a virtualenv
	cd poll_site && ./manage.py collectstatic && gunicorn --bind :8000 --workers 1 poll_site.wsgi:application

all: install lint test
