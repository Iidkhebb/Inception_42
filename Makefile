all: 
	@docker-compose -f ./srcs/docker-compose.yml up
down:
	@docker-compose -f ./srcs/docker-compose.yml down
re:
	@docker-compose -f srcs/docker-compose.yml up --build
clean:
	echo "Cleaning ..."
	docker system prune -f
	docker stop $$(docker ps -qa) 2>/dev/null;\
	docker rm $$(docker ps -qa)  2>/dev/null; \
	docker rmi -f $$(docker images -qa)  2>/dev/null; \
	docker volume rm $$(docker volume ls -q)  2>/dev/null;\
	docker network rm $$(docker network ls -q)  2>/dev/null;\
	echo "Cleaning VL Disc Space..."
	@rm -rf ./srcs/vl_test/db/*
	@rm -rf ./srcs/vl_test/wp/*

.PHONY: all re down clean