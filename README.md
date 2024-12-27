# Kubernetes e Docker App

Este projeto foi desenvolvido para demonstrar como integrar Docker e Kubernetes para construir e executar uma aplicação PHP com um banco de dados MySQL. O objetivo é fornecer uma solução escalável e de fácil gestão para ambientes de produção.

## Tecnologias Utilizadas

- **Docker**: Para criar e gerenciar os contêineres da aplicação e do banco de dados.
- **Kubernetes**: Para orquestrar e gerenciar os contêineres em um cluster.
- **Minikube**: Usado para emular um cluster Kubernetes local.
- **PHP**: Para a criação da aplicação web backend.
- **MySQL**: Usado como banco de dados.

## Estrutura do Projeto

- **Dockerfiles**: Arquivos de configuração para construir as imagens Docker para o backend (PHP) e o banco de dados (MySQL).
- **Vagrantfile**: Arquivo usado para configurar o ambiente local com Vagrant e Docker.
- **Arquivos Kubernetes**: Configurações YAML para os **Deployments**, **Services**, e **PersistentVolumes**.
- **Banco de Dados**: Inicialização do banco de dados via SQL no MySQL.

## Como Executar o Projeto Localmente

### Pré-requisitos

- **Docker**: Instale o Docker em sua máquina.
- **Minikube**: Para rodar um cluster Kubernetes local.
- **kubectl**: Ferramenta de linha de comando para interagir com o Kubernetes.

### Passos para Subir o Projeto

1. **Build das Imagens Docker**:
    ```bash
    docker build -t seu_usuario/projeto-backend:1.0 backend/
    docker build -t seu_usuario/projeto-database:1.0 database/
    ```

2. **Push das Imagens para o Docker Hub**:
    ```bash
    docker push seu_usuario/projeto-backend:1.0
    docker push seu_usuario/projeto-database:1.0
    ```

3. **Aplicando as Configurações no Kubernetes**:
    - Crie o PersistentVolume:
    ```bash
    kubectl apply -f ./pv.yml
    ```
    - Crie os serviços:
    ```bash
    kubectl apply -f ./services.yml
    ```
    - Crie os deployments:
    ```bash
    kubectl apply -f ./deployment.yml
    ```

4. **Verifique se os Pods estão sendo criados**:
    ```bash
    kubectl get pods
    ```

5. **Acesse o Serviço PHP**:
    - Obtenha o IP do Minikube:
    ```bash
    minikube ip
    ```
    - Use o IP para acessar a aplicação no navegador:
    ```bash
    http://<minikube_ip>:30080
    ```

## Conclusão

Este projeto serve como base para uma aplicação que pode ser escalada e gerida usando Kubernetes e Docker. Ele é flexível e pode ser modificado conforme a necessidade para suportar diferentes tipos de bancos de dados e aplicações.

## Observações

- O projeto foi criado com o objetivo de demonstrar como criar, orquestrar e executar aplicações Dockerizadas usando Kubernetes.
- Certifique-se de ter o Docker e Minikube instalados antes de executar o projeto.
