# #!/bin/bash
source compteur.sh
source fonction.sh


 compteur_question=0
 compteur_reponse=0
#DIRECTORY="KUBERNETES"

 
choose_directory
directory_compteur=`grep compteur_question_total $DIRECTORY/compteur.sh | cut -d "=" -f 2`
echo -e "
            ==========================================================
            <<|>>>   NOMBRE DE QUESTIONS JUSQU'A PRESENT
	    dossier=$DIRECTORY , QUESTION(S)-REPONSE(S)=$directory_compteur  <<<|>>
            ==========================================================
"
# read -p "
# ENTREZ LE REPERTOIRE DE DESTINATION:
# |> " DIRECTORY

while true
do

 read -p "
 =======================================================================
 <<|>>> <<<|>>> <|>>> <<<|>>> <<|>>> <<<|>>> <|>>> <<<|>>> <<|>>> <<<|>> 
 <<|             Faites votre choix: q pour question-réponse,        |>>
   |>>                                                             <<|
 <<|              r pour réinitialiser le questionnaire,             |>>
 <<|               0 ou w pour terminer le programe !?               |>>   
 <<|>>> <<<|>>> <|>>> <<<|>>> <<|>>> <<<|>>> <|>>> <<<|>>> <<|>>> <<<|>> 
 =======================================================================
 |> "  choix

   case $choix in
	r|R)
         reset_questionnaire
	 ;;
      w|W|0) 
         echo "Fin du programme"
         exit;
         ;;
         q|Q|s|S)
         #choose_directory
        if [ $compteur_question_total -gt $compteur_question ] &&  [ $compteur_question_total -gt $compteur_reponse ] 
        then
            compteur_question=$compteur_question_total
            compteur_reponse=$compteur_question_total
        else [ $compteur_question_total -lt $compteur_question ] && [ $compteur_question_total -lt $compteur_reponse ] ;
        
            compteur_question_total=$compteur_question
            compteur_question_total=$compteur_reponse
        fi 
            ((compteur_question ++ ))
            ((compteur_reponse ++ ))
        sed -i -r "s/^(compteur_question_total=).[0-9]*$/\1$compteur_question/" $DIRECTORY/compteur.sh
	echo -e " compteur actuel: $directory_compteur"
        QUESTIONS="|> QUESTION N-$compteur_question"
        REPONSES="|> REPONSE  N-$compteur_reponse"
        quest_resp
	     git_push
      ;; 
      *) echo "ERROR: Selection invalide" 
      ;;
   esac

done
