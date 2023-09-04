.PHONY: start
start:
	docker compose up --wait

.PHONY: build
build:
	docker compose build

.PHONY: ps
ps:
	docker ps

.PHONY: clean
clean:
	docker system prune
