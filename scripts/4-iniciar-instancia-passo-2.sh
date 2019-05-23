#!/bin/bash
# Iniciando o servidor do fluig
echo 'Iniciando o servidor do fluig ...';
docker run --name fluig-server --network host \
   -v /opt/volume:/opt/volume \
   -e dbType=mysql \
   -e dbServer=localhost \
   -e dbPort=3306 \
   -e dbUser=fluig \
   -e dbPassword=OLyVu1gIwWmEr \
   -e dbName=fluig \
   -e solrUrl=http://localhost:8983/solr \
   -e solrIsRemote=true \
   -e solrIsCloud=false \
   -e lsHost=ls.fluig.io \
   -e lsPort=5555 \
   -e fluigHost=localhost \
   -e fluigPort=8080 \
   -e fluigUrl=http://utlab.fluig.io:8080 \
   -e fluigXms=2g \
   -e fluigXmx=3g \
   -e smtpHost=localhost \
   -e smtpPort=25 \
   -e nodeChatAddress=localhost:7777 \
   -e nodeRealtimeAddress=localhost:8888 \
   -d docker.fluig.com/snapshot/fluig/fluig:c37ea34;
