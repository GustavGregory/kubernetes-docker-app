echo "Criando as imagens......."

docker build -t gustavogregory/projeto-backend:1.0 backend/
docker build -t gustavogregory/projeto-database:1.0 database/

echo "Realizando o push das imagens......"

docker push gustavogregory/projeto-backend:1.0
docker push gustavogregory/projeto-database:1.0

echo "Criando PersistentVolume no Cluster Kubernetes...."
kubectl apply -f ./pv.yml

echo "Criando serviços no Cluster Kubernetes...."

kubectl apply -f ./services.yml

echo "Criando os deployments...."

kubectl apply -f ./deployment.yml

echo "FINALIZADO!!!"
