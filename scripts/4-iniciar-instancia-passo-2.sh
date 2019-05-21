#!/bin/bash
# Iniciando o servidor do fluig
echo 'Iniciando o servidor do fluig ...';
docker run --name fluig-server --network fluig-docker-network \
   -p 8080:8080 -v /opt/volume:/opt/volume \
   -e dbType=mysql \
   -e dbServer=database-server \
   -e dbPort=3306 \
   -e dbUser=fluig \
   -e dbPassword=OLyVu1gIwWmEr \
   -e dbName=fluig \
   -e solrUrl=http://index-server:8983/solr \
   -e solrIsRemote=true \
   -e solrIsCloud=false \
   -e lsHost=ls.fluig.io \
   -e lsPort=80 \
   -e fluigHost=fluig-server \
   -e fluigPort=8080 \
   -e fluigUrl=http://utlab.fluig.io:8080 \
   -e fluigXms=2g \
   -e fluigXmx=3g \
   -e smtpHost=fluig-server \
   -e smtpPort=25 \
   -e nodeChatAddress=realtime-server:7777 \
   -e nodeRealtimeAddress=realtime-server:8888 \
   -d docker.fluig.com/snapshot/fluig/fluig:c37ea34;
