# Projeto Docker + NGINX

## 📌 Objetivo

Projeto criado com fins didáticos para aprofundar o entendimento sobre [Docker](https://docs.docker.com/desktop/setup/install/linux/), [**Docker Compose**](https://docs.docker.com/compose/) e [Registry](https://hub.docker.com/_/registry). 

Fiz uso da imagem oficial do [**NGINX**](https://hub.docker.com/_/nginx) que está disponível no [Docker Hub](https://hub.docker.com/) para servir como servidor web da minha aplicação web [Pokedex](https://rgr147.github.io/pokedex/).

## 🧠 Sobre o Projeto

Este projeto consiste em criar uma imagem Docker personalizada para ter o serviço iniciado com o deploy da aplicação web.

Etapas do processo:

1. Instalação do ambiente Linux Ubunto Server com Docker e Docker Compose instalados.
2. Instalação do ```Registry``` como servidor de imagens em um servidor.
3. Configuração do arquivo ```Dockerfile``` com instruções necessárias para criar uma imagem Docker personalizada tendo como base a imagem oficial do NGINX.
4. Criação da imagem Docker com o comando ```docker build```.
5. Configuração do arquivo YAML ```docker-compose.yml"``` com instruções necessárias para subir o container Docker com a minha imagem personalizada.
6. Uso do Docker Compose para subir o container com o serviço do servidor web funcionando.
7. Disponibilizar minha imagem personalizada no Docker Hub para que seja possível baixá-la e testar a imagem. 

## 🐳 Estrutura de arquivos do Linux para uso do Docker

No servidor Linux o `Dockerfile` e os arquivos necessários para aplicação web,compactados em `pokedex.tar`, estão salvos no diretório `/images/my-nginx-pokedex/`
O arquivo `docker-compose.yml` está no diretório `/compose/nginx-pokedex`.
O diretorio local onde ficará salvo os arquivos do web service está definido como `/data/nginx-pokedex`

### Conteúdo do arquivo Dockerfile
```Dockerfile
FROM nginx

WORKDIR /tmp

COPY pokedex.tar /tmp

RUN tar -xf pokedex.tar && mv pokedex/* /usr/share/nginx/html>

LABEL version="1.0"
LABEL description="Imagem NGINX já com o conteúdo web para subir a aplicação pokedex"

VOLUME /usr/share/nginx/html

EXPOSE 80

```

### Conteúdo do arquivo compose YAML
```yaml
services:
  web:
    image: nginx
    container_name: pokedex-nginx-app

    volumes:
      - web_data:/etc/nginx/templates
      - /data/nginx-pokedex:/usr/share/nginx/html
    ports:
      - "8080:80"

    environment:
      - NGINX_HOST=foobar.com
      - NGINX_PORT=80

volumes:
  web_data:
```





   
## 🧠 Sobre o Projeto Web (Pokedex)

O projeto consiste em páginas HTML que utilizam JavaScript para fazer requisições HTTP à PokeAPI e exibir informações como nome, imagem e dados dos Pokémons.
Funcionalidades:

Confira o projeto na página do github: Link [Pokedex](https://github.com/rgr147/pokedex)


## 🚀 Como Executar

    1. Certifique-se de ter o Docker e Docker Compose instalados.

    2. Clone ou copie o diretório com o compose-docker.yml.

    3. Navegue até o diretório onde está o arquivo docker-compose e execute:

    ```docker compose up```

    📝 Observações

    A porta padrão 80 do container está exposta na porta 8080 do host.

    O diretório /data/nginx-A deve existir. Você pode utilizar o meu projeto web Pokedex ou o seu próprio projeto contendo o index.html copiando os arquivo para dentro desse diretório

## 📚 Aprendizados

 Utilização básica de Docker Compose

 Montagem de volumes entre host e container

 Uso do NGINX como servidor estático

## 📌 Tecnologias utilizadas

![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)  ![Docker Compose](https://img.shields.io/badge/Docker%20Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white) ![Registry](https://img.shields.io/badge/Registry-555555?style=for-the-badge&logo=docker&logoColor=white)
 ![NGINX](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)  ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)  ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)

 ## 📁 Estrutura de Diretórios do Projeto Web Utilizado
```
/data/nginx-A/
├── assets/
│   ├── css/
│   ├── images/
│   └── js/
├── prints/
├── index.html
├── pagina-about.html
└── README.md
```

## 🧠 Sobre o Projeto Web (Pokedex)

O projeto consiste em páginas HTML que utilizam JavaScript para fazer requisições HTTP à PokeAPI e exibir informações como nome, imagem e dados dos Pokémons.
Funcionalidades:

Confira o projeto na página do github: Link [Pokedex](https://github.com/rgr147/pokedex)

