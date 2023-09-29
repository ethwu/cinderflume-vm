.PHONY: start
start:
	docker compose up --wait

.PHONY: build
build:
	docker compose build

.PHONY: stop
stop:
	docker compose down --wait

.PHONY: ps
ps:
	docker ps

.PHONY: clean
clean:
	docker system prune
