NAME =	inception

all:		$(NAME)

$(NAME):
			docker-compose -f ./srcs/docker-compose.yml up --build

clean:
			docker-compose -f ./srcs/docker-compose.yml down

fclean:		clean
			docker system prune -af
			sudo rm -rf /home/gcefalo/data/db
			sudo rm -rf /home/gcefalo/data/wordpress

.PHONY:		all clean fclea