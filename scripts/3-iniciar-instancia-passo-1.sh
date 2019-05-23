#!/bin/bash
# Iniciando o servidor do Realtime
echo 'Iniciando o servidor Realtime ...';
docker run --name realtime-server --network bridge \
     -d docker.fluig.com/snapshot/fluig/node:c37ea34;
# Iniciando o servidor de indexação e busca
echo 'Iniciando o servidor de busca e indexação ...';
docker run --name index-server --network bridge \
     -d docker.fluig.com/snapshot/fluig/solr:c37ea34;
# Iniciando o servidor de banco de dados MySQL
echo 'Iniciando o servidor de banco de dados ...';
docker run --name database-server --network bridge \
     -e MYSQL_ROOT_PASSWORD=YuCBDOZnqE5vL \
     -e MYSQL_USER=fluig \
     -e MYSQL_PASSWORD=OLyVu1gIwWmEr \
     -e MYSQL_DATABASE=fluig \
     -d docker.fluig.com/fluig/mysql;
