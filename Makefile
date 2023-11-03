# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybenlafk <ybenlafk@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/02 12:00:21 by ybenlafk          #+#    #+#              #
#    Updated: 2023/11/02 12:13:46 by ybenlafk         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: run
	
run:
	@docker-compose -f ./srcs/docker-compose.yml up --build

clean:
	@docker system prune -a