compteur_question_total=5

   |> QUESTION N-1 
   |QN-1=> Get the KIND value of a namespace 
   |> REPONSE  N-1
   |RN-1=> kubectl api-resources | grep -iE 'namespace|KIND'
   

   |> QUESTION N-2 
   |QN-2=> Get the apiVrersion 
   |> REPONSE  N-2
   |RN-2=> kubectl explain Namespace | head -n 2
   

   |> QUESTION N-3 
   |QN-3=> create a namespace 
   |> REPONSE  N-3
   |RN-3=> kubectl create ns my_custom_namespace
   

   |> QUESTION N-4 
   |QN-4=> Get the yaml of default namespace 
   |> REPONSE  N-4
   |RN-4=> kubectl get ns default -o yaml
   

   |> QUESTION N-5 
   |QN-5=> delete all ressource in a namespace 
   |> REPONSE  N-5
   |RN-5=> kubectl delete all --all -n namespace-name
   
