docker:
	docker-compose build --force-rm && \
	docker-compose run install-great-expectations && \
	docker-compose down

clear:
	docker ps -a | awk '{ print $$1,$$2 }' | grep install-great-expectations | awk '{print $$1 }' | xargs -I {} docker rm {}

install-great-expectations:
	make clear
	time (make docker)
