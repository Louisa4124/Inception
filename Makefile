# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lboudjem <lboudjem@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/20 11:14:56 by lboudjem          #+#    #+#              #
#    Updated: 2023/11/23 15:38:41 by lboudjem         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


COMPOSE	=	docker-compose -f srcs/docker-compose.yml 


all	:	up


up 	:	volumes
	${COMPOSE} up -d --build
	
down:
	${COMPOSE} down 

clean	:
		${COMPOSE} down --rmi all -v --remove-orphans

fclean	:	clean
		sudo rm -rf /home/${USER}/data/

re	:	fclean all
 
	

logs:
	# @docker logs mariadb
	# @docker logs nginx
	@docker logs wordpress

ps :
	@echo "=========== containers ================"
	@${COMPOSE} ps
	@echo "============= volumes ================="
	@docker volume ls
	@echo "============== images ================="
	@docker images
	@echo "=============================="
	
data:
	ls -l /home/${USER}/data/*
	

volumes	:
		mkdir -p /home/${USER}/data/wordpress
		mkdir -p /home/${USER}/data/mariadb

sclean:
	docker stop $(docker ps -qa); 
	docker rm $(docker ps -qa); 
	docker rmi -f $(docker images -qa); 
	docker volume rm $(docker volume ls -q);
	docker network rm $(docker network ls -q);

.PHONY:	all re clean fclean up down prune ps data volumes

