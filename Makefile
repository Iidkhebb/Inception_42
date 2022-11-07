all: 
	@docker-compose -f ./srcs/docker-compose.yml up
down:
	@docker-compose -f ./srcs/docker-compose.yml down
re:
	@docker-compose -f srcs/docker-compose.yml up --build
clean:
	echo "Cleaning ..."
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	echo "Cleaning VL Disc Space..."
	@rm -rf ./srcs/vl_test/db/*
	@rm -rf ./srcs/vl_test/wp/*

.PHONY: all re down clean