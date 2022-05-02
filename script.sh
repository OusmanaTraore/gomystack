#!/bin/bash

etape=1
totalEtape=5
while true 

do
	if [[ $etape -gt $totalEtape ]]
	then
		 echo "===|        THANKS FOR USING IT       |==="
		 exit
	else
		echo "STEP-$etape/$totalEtape"
		read -p   "|> " entree
		echo " If STEP-$etape finished , tape done  and press enter"
		read fin
		case $fin in
		done)
			echo "NEXT STEP:"
			((etape++))
			tot=$(($totalEtape + 1))
			if [[ $etape -eq $tot ]] 
			then
				echo "===| CONGRATUALTIONS, YOU'VE SUCCEED! |==="
				sleep 1
				echo "===|            ENJOY IT              |==="
				sleep 2
			fi
			continue
			;;
		*)
			echo "CASE NOT IMPLEMENTED"
		;;
	
esac
	fi
done

