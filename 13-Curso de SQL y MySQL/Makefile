USERNAME ?= $(USER)
DATA_PATH ?= ./mysql

.PHONY: prepare start stop down

prepare:
	mkdir -p $(DATA_PATH)
	mkdir -p $(DATA_PATH)/data
	mkdir -p $(DATA_PATH)/config

start:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down
