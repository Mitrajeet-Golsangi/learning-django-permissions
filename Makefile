# Define the Poetry command to use
POETRY := poetry

# Define the Django command to use
DJANGO := $(POETRY) run python -m src.manage

# Define the default target
.DEFAULT_GOAL := help

# Define the initialization target
.PHONY: init
init: clean install migrate
		@echo "Project initialization complete ! Run make run to start the server"
# Define the help target
.PHONY: help
help:
		@echo "Usage: make <target>"
		@echo ""
		@echo "Targets:"
		@echo "  install     Install dependencies"
		@echo "  run         Run the Django development server"
		@echo "  run         Run the Django development server"
		@echo "  shell       Run the Django shell"
		@echo "  migrate     Apply database migrations"
		@echo "  superuser   Create a superuser"
		@echo "  test        Run tests"
		@echo "  testreport  Generate a test coverage report"
		@echo "  lint        Run linters"
		@echo "  format      Format code using black"
		@echo "  clean       Remove generated files"

# Define targets for each Django command
.PHONY: install
install:
		$(POETRY) install

update: install migrate ;

.PHONY: run
run:
		$(DJANGO) runserver

.PHONY: shell
shell:
		$(DJANGO) shell

.PHONY: migrate
migrate:
		$(DJANGO) makemigrations
		$(DJANGO) migrate

.PHONY: superuser
superuser:
		$(DJANGO) createsuperuser

.PHONY: testreport
testreport:
		$(POETRY) run pytest --cov-report html --cov-report term --cov=.

.PHONY: test
test:
		$(POETRY) run pytest

.PHONY: lint
lint:
		$(POETRY) run flake8

.PHONY: format
format:
		$(POETRY) run black .
.PHONY: clean
format:
		rm -rf .pytest_cache '.mypy_cache' htmlcov '__pycache__' .coverage '*.pyc'