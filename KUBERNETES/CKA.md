1. Etcd backup et restore
2. PV et PVC
3. ClusterRole et Binding
4. Upgrade
5. Ingress
6. Network Policy
7. Node NoSchedule
8. Scaling Déploiement

- [x]   Create pod with image nginx called nginx2 and expose traffic on port 80
        and set  an env value as 'NGINX_PORT=80'
        kubectl -n demo run nginx2 --image=nginx --port=80 --env=NGINX_PORT=80
        kubectl -n demo get pod
        kubectl -n demo set image  pod/nginx2 nginx2=nginx:1.19.8 --record
        kubectl -n demo get pod
        kubectl -n demo describe pod nginx2

- [x]  Get 'nginx2' pod's IP created in previous step , use a tem busybox image to wget of it's '/'
       and save to '/tmp/nginx-index.txt'

       kubectl -n demo  get pod -owide
       export NGINX_IP="IP here"

       kubectl -n demo run busybox --image=busybox --restart=Never --rm  -it \
       -- wget -O- http://$NGINX_IP/ > /tmp/nginx-index.txt

       cat /tmp/nginx-index.txt

       kubectl -n demo get po  (pod is no longer here)

- [x] Create an 'myfrontend' pod in demo namespace with nginx image and set an env value as 
      'var1=val1'. Check the env value existence within the pod.

      kubectl -n demo  run my frontend  --image=nginx --env=var=val1
      kubectl -n demo exec -it myfrontend --sh
        env
        exit

- [x] Create a busyboxgoogle pod with image 'busybox' in demo namespace which
       executes 'sleep 3600;' command.
      Connect to interactive shell of the pod and save the current date to
      '/tmp/date.txt' inside the container.

      kubectl -n demo run busyboxgoogle --image=busybox  --restart=Never --command \
      -- /bin/sh -c 'sleep 36000;'
      kubectl -n demo get po 
      kubectl -n demo exec  -it busyboxgoogle -- sh 
       # cat date > '/tmp/date.txt'
       # cat /tmp/date.txt
       # exit
    


- [x] Create a secret with your docker username and your docker password from file
        kubectl create secret generic docker-secret \
        --from-file=username=./secretDocker.txt \
        --from-file=password=./secretDocker.txt

      Verify the secret 
        kubectl get secrets
        kubectl describe secrets/docker-secret

     Decoding the secret
        kubectl get secret docker-secret -o jsonpath='{.data}'
        kubectl get secret docker-secret -o jsonpath='{.data.username}, {.data.pasword}' | base64 --decode

- [x] Create a secret with your docker username and your docker password from literal
        kubectl  -n testdocker create secret generic docker-secret \
        --from-literal=username=./secretDocker.txt \
        --from-literal=password=./secretDocker.txt

- [x] Create a deployment redis with image redis and expose it's port on 6379
 Get the dns record  for the service and pods for the deployment redis
  and put the value in the below files
  /tmp/dns-record-pod & /tmp/dnsrecords-svc

  kubectl create deployment redis --image=redis 
  kubectl expose deployment redis --port=6379 --targetPort=6379 


