#!/bin/bash

lettreRes=()
for i in {a..z}
do
resNumber=$(kubectl api-versions | egrep ^$i | wc -l)
res=$(kubectl api-versions | egrep ^$i )

       if [[ $resNumber != 0 ]]
       then
	echo "Les ressources commencant par $i sont égales à: $resNumber "
	echo ""
	echo "liste des ressource ($i):"
	echo $res
       else
        lettreRes+=${i}	       
       fi
done
echo -e "Il n'ya pas de ressources commencant par une des lettres suivantes: 
	[$lettreRes]"
