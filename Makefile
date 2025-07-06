EXEC_NODE = docker compose run --rm node

install:
	$(EXEC_NODE) npm install

dev:
	docker compose up

build:
	$(EXEC_NODE) npm run build

lint:
	$(EXEC_NODE) npm run lint

format:
	$(EXEC_NODE) npm run format

bash:
	docker compose run --rm node sh

perms:
	sudo chown -R $(shell id -u):$(shell id -g) vue
	sudo chmod -R u+rwX vue

init:
	docker run --rm -it \
		-v $(PWD)/vue:/app \
		-w /app \
		node:20-alpine \
		sh -c "npm create vue@latest ."
	$(MAKE) perms
	$(MAKE) install
	$(MAKE) dev

