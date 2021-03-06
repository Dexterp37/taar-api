.PHONY: build migrate shell presto-cli up fixtures tests flake8 docs ci

help:
	@echo "Welcome to taar_api\n"
	@echo "The list of commands for local development:\n"
	@echo "  build          Builds the docker images for the docker-compose setup"
	@echo "  migrate        Runs the Django database migrations"
	@echo "  shell          Opens a Bash shell"
	@echo "  django-shell   Opens a Bash shell"
	@echo "  up         	Runs the whole stack, served under http://localhost:8000/"
	@echo "  tests      	Run pytest tests using tox"
	@echo "  flake8     	Run flake8 using tox"
	@echo "  docs       	Build the docs using tox"
	@echo "  ci         	Run tests, flake8 and docs"

build:
	docker-compose build

migrate:
	docker-compose run web python manage.py migrate --run-syncdb

shell:
	docker-compose run web bash

django-shell:
	docker compose run web manage.py shell

up:
	docker-compose up

tests:
	docker-compose run web tox -etests

flake8:
	docker-compose run web tox -eflake8

docs:
	docker-compose run web tox -edocs

ci:
	docker-compose run web tox
