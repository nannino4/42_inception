NAME =	inception

all:		$(NAME)

$(NAME):
			docker-compose -f ./srcs/docker-compose.yml up --build

domain:
			echo "127.0.0.1 gcefalo.42.fr" | sudo tee -a /etc/hosts

clean:
			docker-compose -f ./srcs/docker-compose.yml down

cleanv:		clean
			sudo rm -rf /home/gcefalo/data/db
			sudo rm -rf /home/gcefalo/data/wordpress

fclean:		clean
			docker system prune -af
			sudo rm -rf /home/gcefalo/data/db
			sudo rm -rf /home/gcefalo/data/wordpress

.PHONY:		all clean fclean cleanv domain $(NAME)