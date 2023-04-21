help: ## Shows this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_\-\.]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

shell: ## starts up a shell inside the php container
	@docker-compose exec php bash

db: ## starts up a mysql shell inside the php container
	@docker-compose exec php bash -c 'mysql -u $$MYSQL_USER -p$$MYSQL_PASSWORD -h $$MYSQL_HOST $$MYSQL_DATABASE'
