# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chchin <chchin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/17 15:42:40 by chchin            #+#    #+#              #
#    Updated: 2022/05/19 12:01:13 by chchin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libftprintf.a
SRCS		= ft_printf.c ft_printf_utils.c
OBJS		= ${SRCS:.c=.o}
LIBFT_OBJS	= libft/*.o
CC			= gcc
CFLAGS		= -Wall -Werror -Wextra
RM			= rm -f
AR			= ar rcs

.c.o:
			${CC} ${CFLAGS} -Idir -c $< -o ${<:.c=.o}

all:		${NAME}

${NAME}:	${OBJS}
			make -C libft
			${AR} ${NAME} ${OBJS} ${LIBFT_OBJS}

clean:
			${RM} ${OBJS}
			make -C libft clean

fclean:		clean
			${RM} ${NAME} libft/libft.a

re:			fclean all

.PHONY:		all clean fclean re
