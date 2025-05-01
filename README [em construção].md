# Projeto Docker + NGINX

## 📌 Objetivo

Projeto criado com fins didáticos para aprofundar o entendimento sobre [**Docker Compose**](https://docs.docker.com/compose/). Fiz uso da imagem oficial do [**NGINX**](https://hub.docker.com/_/nginx) que está disponível no [Docker Hub](https://hub.docker.com/) para funcionar servir como servidor web de um projeto web que é alimentado pela API [**PokeAPI**](https://pokeapi.co/) com informações dos pokemons.

## 🧠 Sobre o Projeto

Este projeto consiste em criar uma imagem Docker personalizada para ter o serviço iniciado e deploy da aplicação Pokedex.

Etapas do processo:

1. Instalação do ambiente Linux Ubunto Server com Docker e Docker Compose instalados.
2. Edição do arquivo Dockerfile com instruções necessárias para criar uma imagem Docker usando o imagem Docker oficial do NGINX.
3. Criação da imagem Docker com o comando ```docker build```.
4. Edição do arquivo YAML "docker-compose.yal" com instruções necessárias para subir o container Docker com a imagem personalizada.
5. Uso do Docker Compose para subir o container com o servidor web NGINX funcionando.

## 🐳 Estrutura de arquivos do Linux para uso do Docker

No servidor Linux o `Dockerfile` e os arquivos necessários para aplicação web,compactados em `.tar`, estão salvos no diretório `/images/nginx-pokedex/`
O arquivo `docker-compose.yml` está no diretório `/compose/nginx-pokedex`.
O diretorio local onde ficará salvo os arquivos do web service está definido como `/data/nginx-pokedex`




O serviço principal é o **NGINX**, baixado via Docker Hub. O arquivo `docker-compose.yml` foi configurado para:

- Criar e subir um container do NGINX
- Mapear uma porta local para acesso via navegador
- Montar um volume local onde está o projeto HTML, permitindo que o NGINX sirva os arquivos diretamente

```yaml
services:
  web:
    image: nginx
    container_name: pokedex-nginx-app

    volumes:
      - web_data:/etc/nginx/templates
      - /data/nginx-A:/usr/share/nginx/html
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

![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)  ![Docker Compose](https://img.shields.io/badge/Docker%20Compose-2496ED?style=for-the-badge&logo=docker&logoColor=white)  ![NGINX](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)  ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)  ![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)

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

