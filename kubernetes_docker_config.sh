#!/usr/bin/bash
kubectl create secret generic regcred --from-file=.dockerconfigjson=/home/moises/.docker/config.json --type=kubernetes.io/dockerconfigjson
