#!/bin/bash
source fonction.sh
echo -e "
=========================================
| Pour lancer le programme, vous devez  |
|           entrer un numéro            |
|===============      ==================|
| 1- Prendre une PHOTO                  |
| 2- Capture d'écran                    |
| 3- Enregistrement video               |
=========================================
"

read -p " Faites votre choix, tapez un numéro !
|> " numero;

case $numero in 
    1) 
        echo "PHOTO";;
    2) 
        echo "Capture ECRAN";;
    3) 
        echo "CAMERA (enregistrement)";;
    *)
        echo "CAS NON IMPLEMENTE" ;;
esac
