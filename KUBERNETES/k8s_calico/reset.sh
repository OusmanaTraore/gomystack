#!/bin/bash
###====================================================================
###                          FONCTIONS                              ###
reset_and_remove(){
     sudo kubeadm reset
     sudo rm -rf /etc/cni/net.d
     sudo apt purge kubeadm kubelet kubectl -y
     sudo apt autoremove
     sudo rm -R $HOME/.kube
    if [  "${IP_ETH1}" ] then   
           sudo sed -i "s/^$IP_ETH1.*$//"  /etc/hosts 
    else
        sudo sed -i "s/^192.*$//"  /etc/hosts 
    fi
    
     }

reset_and_remove