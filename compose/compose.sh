#!/bin/bash
export COMMAND ?= "none"

function exportarVariaveis() {
  # Exporta as variaveis de ambiente
  export $(cat ./env.conf);
}

function lerParametros() {}
  COMMAND=$1
  case $COMMAND in
      "start")
      iniciarContainers
      ;;
      "stop")
      terminarContainers
      ;;
      *) # opcao desconhecida
      echo "Parâmetros inválidos. As opções são: start e stop."
      ;;
  esac
}

function terminarContainers() {
  # Termina a execução de todos os containers
  echo " Terminando o fluig com o docker-compose ..."
  docker-compose down
  echo " Pronto!"
  # Remove as imagens de todos os containers antigos
  #echo " Removendo imagens antigas..."
  #images=`docker images -qa`
  #if [ -n "$images" ]; then
  #  docker images --format "{{.ID}}:{{.Tag}}" | grep -v ${version} | cut -d: -f 1 | xargs docker rmi
  #fi
  #echo " Done!"
}

function iniciarContainers() {
  terminarContainers
  echo " Iniciando o fluig com o docker-compose ..."
  docker-compose -f docker-compose.yml up -d
  echo " Pronto!"
}

exportarVariaveis
lerParametros
