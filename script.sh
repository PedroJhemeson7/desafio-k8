#!/bin/bash

echo "Criando as imagens"
echo "Criando as imagem para o backend"
sudo docker build -t pedrojhemeson/projeto-backend:1.0 backend/.
echo "Criando as imagem para o database"
docker build -t pedrojhemeson/projeto-database:1.0 database/.

echo "realizando push das imagens"
sudo docker push pedrojhemeson/projeto-backend:1.0
sudo docker push pedrojhemeson/projeto-database:1.0

echo "criando Serviços  no cluster k8s"
kubectl apply -f ./services.yml

echo "criando os deployment"
kubectl apply -f ./deployment.yml

