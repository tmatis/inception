# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmatis <tmatis@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/30 16:51:58 by tmatis            #+#    #+#              #
#    Updated: 2021/08/30 16:51:58 by tmatis           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

all: $(NAME)

$(NAME):
	mkdir -p /home/tmatis/data/code
	mkdir -p /home/tmatis/data/data

	docker-compose --project-directory srcs -f srcs/docker-compose.yml up --build

clean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down
	docker volume rm srcs_database
	docker volume rm srcs_website
	sudo rm -rf /home/tmatis/data/data
	sudo rm -rf /home/tmatis/data/code

fclean:	clean

re:	clean all

setup:
	sudo chmod 777 /var/run/docker.sock
	sudo echo "127.0.0.1	tmatis.42.fr" >> /etc/hosts

.PHONY:	all clean fclean re setup
