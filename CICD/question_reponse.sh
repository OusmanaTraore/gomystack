# #!/bin/bash
source compteur.sh
source fonction.sh


# compteur_question=0
# compteur_reponse=0


echo -e "
            ==========================================================
            <<|>>>   NOMBRE DE QUESTIONS JUSQU'A PRESENT = $compteur_question_total  <<<|>>
            ==========================================================
"

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
         choose_directory
        if [ $compteur_question_total -gt $compteur_question ] &&  [ $compteur_question_total -gt $compteur_reponse ] ; 
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
        echo -e " compteur actuel: $compteur_question_total"
        QUESTIONS="|> QUESTION N-$compteur_question"
        REPONSES="|> REPONSE  N-$compteur_reponse"
        quest_resp
	     git_push
      ;; 
      *) echo "ERROR: Selection invalide" 
      ;;
   esac

done


