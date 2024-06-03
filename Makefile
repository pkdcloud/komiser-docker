.DEFAULT_GOAL := help

export AWS_DEFAULT_REGION=ap-southeast-2

up: .env ## Start Komiser Service
	docker compose up -d
	@echo "\nAccess the Komiser Service here: http://localhost:3000"
down: ## Stop Komiser Service
	docker compose down

logs: ## Get Komiser Logs
	docker compose logs -f komiser

clean: ## Removes Komiser Service
	docker compose down
	docker rmi komiser

.env:
	touch .env; \
	docker compose run --rm envvars validate; \
	docker compose run --rm envvars envfile --overwrite; \
	docker compose run --rm envvars ensure; \

help:
	@echo "\nUsage: make [TARGET]\n"
	@echo "Makefile Targets:"
	@awk -F':.*##' '/^[^\t].+?:.*##/ { printf " \033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

.PHONY: .env run clean logs help
