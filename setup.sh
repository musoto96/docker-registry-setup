#!/usr/bin/bash

if [ $(docker container ls | grep registry | wc -l) -gt 0 ]
then
  echo "Registry up"
else
  echo "Registry down"
  docker-compose up -d
  sleep 5
fi

docker login registry.domain.com
kubectl version --client
if [ $? ge 127 ]
then
  echo "kubectl not installed, exiting"
else 
  echo "Creating credentials"
  kubectl create secret generic regcred --from-file=.dockerconfigjson=${HOME}/.docker/config.json --type=kubernetes.io/dockerconfigjson
  echo "Done"
fi

