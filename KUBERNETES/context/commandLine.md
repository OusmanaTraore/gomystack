# Context

    1. Get context
    kubectl config  get-contexts 

    2. Create a context
    kubectl config set-context context-minikube --cluster=cluster-minikube --user=user-minikube --namespace=namespace-minikube

    3. Switch to context 
    kubectl config use-context <context-name>
    kubectl config use-context context-minikube

    4. Delete Context
    kubectl config delete-context <context-name>

# Namespace


    1. Get namespace
    kubectl  get namespace

    2. Create a namespace
    kubectl create  namespace <namespace-name>
    kubectl create  namespace namespace-minikube 

    3. Delete namespace
    kubectl  delete namespace <namespace-name>

# Deployments
    
    export do="--dry-run=client -o yaml "

    1. Get deployment
    kubectl -n <namespace-name> get deployment

    2. Create a deployment

    kubectl -n <namespace-name> create deployment webapp1 --image=hshar/webapp1 --port=8081 $do > webapp-deployment

    3. Delete deployment
    kubectl -n <namespace-name> delete deployment <deployment-name> 

# Services
    1. NodePort
    kubectl create service nodeport webapp-sql --tcp=80  $do > webservices
    
    2. ClusterIP
    kubectl create  service clusterip  webapp-sql1 --tcp=3306 --clusterip="None" $do > webservices-sql

    3.