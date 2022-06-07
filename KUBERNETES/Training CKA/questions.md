
- [x] Namespace : cka-training
- [x] export do="--dry-run=client -o yaml"

1. Create deployment named first-deployment with image nginx
    ```
    $ kubectl -n cka-training run first-deployment --image=nginx $do > nginxpod.yaml

    ```
2. change image nginx of this deployment to busybox
    ```
    kubectl -n cka-training set image pod/first-deployment first-deployment=busybox

    ```
3. Create pod with image redis and labels disktype=ssd
    ```
    kubectl -n cka-training run second-deployment \
    --image=redis \
    --labels=disktype=ssd $do > redislabelpod.yaml

    ```







