#!/bin/bash
### Remove os volumes orfaos criados por containers já excluídos
echo "Removendo volumes orfãos ...";
docker rm $(docker ps -a | awk '{if (NR!=1) {{print $1}}}');
echo "Pronto!";
