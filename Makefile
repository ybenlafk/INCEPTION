# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybenlafk <ybenlafk@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/02 12:00:21 by ybenlafk          #+#    #+#              #
#    Updated: 2023/11/06 16:32:45 by ybenlafk         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: run
	
run:
	@mkdir -p /tmp/wp
	@mkdir -p /tmp/db
	@docker-compose -f ./srcs/docker-compose.yml up --build

clean:
	@docker system prune -a
	@docker volume prune
	@rm -rf /tmp/wp
	@rm -rf /tmp/db