#!/bin/bash
# Criando uma rede virtual no Docker
dockerNetwork=$(docker network ls | grep fluig-docker-network | awk '{ print $2 }');
if [ $dockerNetwork = "fluig-docker-network" ]; then
  echo 'A rede do docker está disponível: fluig-docker-network.';
else
  docker network create fluig-docker-network;
  echo 'A rede do docker foi criada com sucesso.';
fi
# Iniciando o servidor do Realtime
echo 'Iniciando o servidor Realtime ...';
docker run --name realtime-server --network fluig-docker-network --rm \
     -p 7777:7777 -p 8888:8888 \
     -d docker.fluig.com/snapshot/fluig/node:c37ea34;
# Iniciando o servidor de indexação e busca
echo 'Iniciando o servidor de busca e indexação ...';
docker run --name index-server --rm --network fluig-docker-network \
     -p 8983:8983 -d docker.fluig.com/snapshot/fluig/solr:c37ea34;
# Iniciando o servidor de banco de dados MySQL
echo 'Iniciando o servidor de banco de dados ...';
docker run --name database-server --network fluig-docker-network --rm \
     -p 3306:3306 \
     -e MYSQL_ROOT_PASSWORD=YuCBDOZnqE5vL \
     -e MYSQL_USER=fluig \
     -e MYSQL_PASSWORD=OLyVu1gIwWmEr \
     -e MYSQL_DATABASE=fluig \
     -d docker.fluig.com/fluig/mysql;
