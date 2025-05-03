FROM nginx

WORKDIR /usr/share/nginx/html

RUN rm /usr/share/nginx/html/index.html

ADD pokedex.tar /usr/share/nginx/html

LABEL version="2.0"
LABEL description="Imagem NGINX já com o conteúdo web para subir a aplicação pokedex" 

VOLUME /usr/share/nginx/html

EXPOSE 80
