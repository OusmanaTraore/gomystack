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
    
    