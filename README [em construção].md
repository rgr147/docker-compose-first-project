# Projeto Docker + NGINX

## 📌 Objetivo

Projeto criado com fins didáticos para aprofundar o entendimento sobre [Docker](https://docs.docker.com/desktop/setup/install/linux/), [**Docker Compose**](https://docs.docker.com/compose/) e [Registry](https://hub.docker.com/_/registry). 

Fiz uso da imagem oficial do [**NGINX**](https://hub.docker.com/_/nginx) que está disponível no [Docker Hub](https://hub.docker.com/) para servir como servidor web da minha aplicação web [Pokedex](https://rgr147.github.io/pokedex/).

## 🧠 Sobre o Projeto

Este projeto consiste em criar uma imagem Docker personalizada para ter o serviço iniciado com o deploy da aplicação web.

A imagem gerada está disponibilizada no Docker Hub [rogede/roger-nginx-pokedex](https://hub.docker.com/r/rogede/roger-nginx-pokedex)

Etapas do processo:

    1. Instalação do ambiente Linux Ubunto Server com Docker e Docker Compose instalados.
    2. Instalação do ```Registry``` em um servidor local para servir como servidor de imagens.
    3. Configuração do arquivo ```Dockerfile``` com instruções necessárias para criar uma imagem Docker personalizada tendo como base a imagem oficial do NGINX.
    4. Criação da imagem Docker com o comando ```docker build```.
    5. Configuração do arquivo YAML ```docker-compose.yml"``` com instruções necessárias para subir o container Docker com a minha imagem personalizada.
    6. Uso do Docker Compose para subir o container com o serviço do servidor web funcionando.
    7. Disponibilizar minha imagem personalizada no Docker Hub para que seja possível baixá-la para testes 

## 🐳 Estrutura de arquivos no Linux para uso do Docker

No servidor Linux o arquivo `Dockerfile`, para a criação da imagem personalizada, esta salvo no diretório `/images/my-nginx-pokedex/`, junto com o `pokedex.tar` que contém os arquivos da aplicação web.
O arquivo `docker-compose.yml`, para subir o serviço com a imagem personalizada, está no diretório `/compose/nginx-pokedex`.
O diretorio local definido como `Volume Bind` para salver os arquivos da aplicação web está definido como `/data/nginx-pokedex/`.

### Conteúdo do arquivo Dockerfile
```Dockerfile
FROM nginx

WORKDIR /usr/share/nginx/html

RUN rm /usr/share/nginx/html/index.html

ADD pokedex.tar /usr/share/nginx/html

LABEL version="2.0"
LABEL description="Imagem NGINX já com o conteúdo web para subir a aplicação pokedex" 

VOLUME /usr/share/nginx/html

EXPOSE 80
```

### Conteúdo do arquivo compose YAML
```yaml
services:
  web:
    image: rogede/roger-nginx-pokedex:2.0
    container_name: pokedex-nginx-app

    volumes:
      - /data/nginx-pokedex/:/usr/share/nginx/html

    ports:
      - "8080:80"

    environment:
      - NGINX_HOST=foobar.com
      - NGINX_PORT=80

```

## 🚀 Como Executar

    1. baixe a imagem que disponibilizei no Docker Hub
    
    2. Certifiquese de ter o Docker e o Docker Compose instalados no seu sistema Linux.
    
    3. Crie os mesmos diretórios especificados na seção "Estrutura de arquivos no Linux para uso do Docker" logo acima. Isso garantirá que você possa extrair o arquivo pokedex.tar no diretório /data/nginx-pokedex/

    Esse é o volume Bind definido no "docker-compose.yml". Caso opte por rodar a imagem sem usar o Docker Compose é necessário apenas definir a porta para acessar o serviço, pois os arquivos da aplicação web já estão na imagem.
    
    4. Dentro do diretório "/compose/nginx-pokedex" execute o comando "docker compose up -d"  para subir o container.

    5. Realize o acesso à aplicação web digitando o o ip da sua máquina e a porta 8080 no navegador.


## 📚 Aprendizados

 Utilização do Docker para gerenciar serviços.
 Utilização do Docker Compose para orquestrar a inicialização de serviços.
 Mount Bind de diretorios para garantir a permanencia de arquivos dos serviços.
 Uso do NGINX como servidor web.

## 📌 Tecnologias utilizadas

![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)  ![Docker Compose](https://img.shields.io/badge/Docker%20Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white) ![Registry](https://img.shields.io/badge/Registry-555555?style=for-the-badge&logo=docker&logoColor=white)
 ![NGINX](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)  ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) 


## 🧠 Sobre o Projeto Web (Pokedex)

Confira o projeto na página do github: Link [Pokedex](https://github.com/rgr147/pokedex)

