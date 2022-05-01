# !/bin/bash
## <========================== FONCTIONS CHOOSE-DIRECTORIE  DEBUT    =========================>
##  fonction demandant question puis réponse
choose_directory(){
   read -p "
   Entrez le dossier pour le stockage des questions-réponses !
   |> "  DIRECTORY
   (( compteur_question_total ++ ))
   if [ ! -d "$DIRECTORY" ]
   then
      echo -e " Le dossier $DIRECTORY n'existe pas."
      echo -e " Création du dossier $DIRECTORY et envoi des questions-réponses"
      mkdir  $DIRECTORY && touch $DIRECTORY/compteur.sh 
      compteur_question=0
      compteur_reponse=0
      compteur_question_total=0
      echo -e "compteur_question_total=0" >> $DIRECTORY/compteur.sh 
   else
      cat $DIRECTORY/compteur.sh
   fi
 
}

### <========================== FONCTIONS CHOOSE-DIRECTORIE  FIN       =========================>
### <========================== FONCTIONS QUESTION-REPONSE  DEBUT    =========================>
###  fonction demandant question puis réponse
quest_resp(){
    echo $QUESTIONS
    read  question
    echo $REPONSES
    read  reponse
   echo -e "
   $QUESTIONS 
   |QN-$compteur_question=> $question 
   $REPONSES
   |RN-$compteur_question=> $reponse
   " >> $DIRECTORY/compteur.sh
}
### <========================== FONCTIONS QUESTION-REPONSE  FIN       =========================>
###
### <========================== FONCTION RESET-QUESTIONNAIRE    DEBUT =========================>
reset_questionnaire(){
   echo -e "Réinitialisation du questionnaire"
   read -p "Entrez le directory à réinitialiser: 
   |> "  DIRECTORY
   if [ ! -d "$DIRECTORY" ]
   then
   mkdir $DIRECTORY
   echo "#!/bin/bash " > $DIRECTORY/compteur.sh
   echo "compteur_question_total=0" >> $DIRECTORY/compteur.sh
   echo $compteur_question_total
   fi
   echo -e "valeur du compteur avant réinitialisation" 
   echo $compteur_question_total
   compteur_question=0
   sleep 2
   echo -e "valeur du compteur après réinitialisation"
   sed -i -r "s/^(compteur_question_total=).[0-9]*$/\1$compteur_question/" $DIRECTORY/compteur.sh
   sleep 2
   echo $compteur_question

}
### <========================== FONCTION RESET-QUESTIONNAIRE    FIN   =========================>
###
### <========================== FONCTION GIT-ADD-COMMIT-PUSH DEBUT    =========================>
git_acp(){
 git add .
 git commit -m "Ajout des $compteur_question_total premières questions-réponses"
 git pull origin master
 git push origin master
}
### <========================== FONCTION GIT-ADD-COMMIT-PUSH    FIN   =========================>
###
### <========================== FONCTION GIT-PUSH   DEBUT             =========================>
git_push(){
     case $compteur_question_total in
        10|20|30|40|50|60|70|80|90|100)
	 git_acp 
	 ;;
 	*) 
         echo "Dizaine non atteint, pas de push"
         ;;
   esac
}
### <========================== FONCTION GIT-PUSH   FIN               =========================>
