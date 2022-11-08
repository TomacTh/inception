IMAGES		= $(shell docker images -q)
CONTAINERS	= $(shell docker ps -aq)
VOLUMES		= $(shell docker volume ls -q)
NETWORK	    = $(shell docker network ls  | grep inception_app)
WP_SRCS		=  ./srcs/requirements/wordpress/wordpress.tar.gz
DB_SRCS		= ./srcs/requirements/mariadb/mysql.tar.gz

DATA_DIR	= /home/tcharvet/data

.PHONY: all build run clean fclean

all: extract run

extract:
	sudo tar -xzvp --same-owner -f $(WP_SRCS) -C $(DATA_DIR)/wp/
	sudo tar -xzvp --same-owner -f $(DB_SRCS) -C $(DATA_DIR)/db/
	sudo cp ./srcs/requirements/adminer-4.8.1.php $(DATA_DIR)/adminer/
	
build:
	docker-compose -f ./srcs/docker-compose.yml build 

run :
	docker-compose -f ./srcs/docker-compose.yml up 

stop :

ifneq ($(CONTAINERS),)
	docker stop $(CONTAINERS)
endif


clean_containers :

ifneq ($(CONTAINERS),)
	docker rm -f $(CONTAINERS)
endif

clean_images : 
ifneq ($(IMAGES),)
	docker rmi -f $(IMAGES)
endif

clean_volumes :

ifneq ($(VOLUMES),)
	docker volume rm -f $(VOLUMES)
endif

clean_network :

ifneq ($(NETWORK),)
	docker network rm inception_app
endif




fclean: clean_containers clean_images clean_volumes clean_network
	sudo rm -rf $(DATA_DIR)/wp/*
	sudo rm -rf $(DATA_DIR)/db/*



