#!/bin/bash
clear
echo -e "\e[0;1m______________________________________________________________________________________________________________________________________\e[0;00m\n"
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;33m1:Give XP\e[0m \e[0;34m_______________________________________________________________\e[0m"
echo
echo -e "\e[0;34m___________________________________________________________\e[0m \e[1;33m2:Remove XP\e[0m \e[0;34m______________________________________________________________\e[0m"		
echo
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;31m3:Give HP\e[0m \e[0;34m_______________________________________________________________\e[0m"
echo
echo -e "\e[0;34m___________________________________________________________\e[0m \e[1;31m4:Remove HP\e[0m \e[0;34m______________________________________________________________\e[0m"
echo
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;34m5:Give MN\e[0m \e[0;34m_______________________________________________________________\e[0m"
echo
echo -e "\e[0;34m___________________________________________________________\e[0m \e[1;34m6:Remove MN\e[0m \e[0;34m______________________________________________________________\e[0m"
echo -e "\e[0;1m______________________________________________________________________________________________________________________________________\e[0;00m\n"
echo
echo -n "                                                          Enter the option:"
read n
case $n in
		1)
			echo -e :Num:Name:::Xp | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaXp=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 6`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;33m$vistaXp\e[0m" | sed 's/:/ \t /g'
			done						
			echo -n "							Who do you want to add?"	
			read a
			echo -n "							How much do you want to add?"			
			read q				
			awk '$1==a{$6+=q}1' a=$a q=$q usuaris.txt >file.txt
			mv file.txt usuaris.txt
			
			xp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 6`
			let nivell=$xp/1000
			awk '$1==a{$5=nivell}1' a=$a nivell=$nivell usuaris.txt >file.txt
			mv file.txt usuaris.txt						
			echo -e :Num:Name:::Xp | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaXp=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 6`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;33m$vistaXp\e[0m" | sed 's/:/ \t /g'
			done									
			presona=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			temps=`date`
			echo "$temps $presona get $q xp" >> Historial.txt
			vidademort=10	
			vidaWarr=80
			manaWarr=80
			vidaHeal=50
			manaHeal=100
			vidaMage=30
			manaMage=130
			zero=0
			numero=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 1`
			nom=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			clase=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 3`
			equip=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 4`
			nivell=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 5`
			xp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 6`
			vida=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 7`
			mana=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 8`
			rp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 9`
			if [ "$clase" = "Warr" ]
			then
				if [ $vida -gt 80 ]
				then
				awk '$1==a{$7=vidaWarr}1' a=$a vidaWarr=$vidaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 80 ]
				then
				awk '$1==a{$8=manaWarr}1' a=$a manaWarr=$manaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Heal" ]
			then
				if [ $vida -gt 50 ]
				then
				awk '$1==a{$7=vidaHeal}1' a=$a vidaHeal=$vidaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 100 ]
				then
				awk '$1==a{$8=manaHeal}1' a=$a manaHeal=$manaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Mage" ]
			then
				if [ $vida -gt 30 ]
				then
				awk '$1==a{$7=vidaMage}1' a=$a vidaMage=$vidaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 130 ]
				then
				awk '$1==a{$8=manaMage}1' a=$a manaMage=$manaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ $vida -lt 0 ]
				then
				awk '$1==a{$7=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $mana -lt 0 ]
				then
				awk '$1==a{$8=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $vida -eq 0 ]
				then
		
				awk '$1==a{$7+=vidademort}1' a=$a vidademort=$vidademort usuaris.txt >file.txt
					mv file.txt usuaris.txt
					echo -e " \e[0;33m$nom is dead\e[0m "	
				        random=$(($RANDOM%8))
					ElCastic=`cat ActivitatsDeMort.txt | grep -w ^$random | cut -d ":" -f 2`
					echo -e "$ElCastic"
					read adefgbwsehjgbhwjegynWEB
			fi
	
			let nivell=$xp/1000
			awk '$1==a{$5=nivell}1' a=$a nivell=$nivell usuaris.txt >file.txt
					mv file.txt usuaris.txt		
			;;
		2)
			echo -e :Num:Name:::Xp | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaXp=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 6`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;33m$vistaXp\e[0m" | sed 's/:/ \t /g'
			done									
			echo -n "							Who do you want to remove?"	
			read a
			echo -n "							How much do you want to remove?"			
			read q				
			awk '$1==a{$6-=q}1' a=$a q=$q usuaris.txt >file.txt
			mv file.txt usuaris.txt
			xp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 6`
			let nivell=$xp/1000
			awk '$1==a{$5=nivell}1' a=$a nivell=$nivell usuaris.txt >file.txt
			mv file.txt usuaris.txt				
			echo -e :Num:Name:::Xp | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaXp=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 6`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;33m$vistaXp\e[0m" | sed 's/:/ \t /g'
			done								
			presona=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			temps=`date`
			echo "$temps $presona lose $q xp" >> Historial.txt
			vidademort=10	
			vidaWarr=80
			manaWarr=80
			vidaHeal=50
			manaHeal=100
			vidaMage=30
			manaMage=130
			zero=0
			numero=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 1`
			nom=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			clase=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 3`
			equip=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 4`
			nivell=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 5`
			xp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 6`
			vida=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 7`
			mana=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 8`
			rp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 9`
			if [ "$clase" = "Warr" ]
			then
				if [ $vida -gt 80 ]
				then
				awk '$1==a{$7=vidaWarr}1' a=$a vidaWarr=$vidaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 80 ]
				then
				awk '$1==a{$8=manaWarr}1' a=$a manaWarr=$manaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Heal" ]
			then
				if [ $vida -gt 50 ]
				then
				awk '$1==a{$7=vidaHeal}1' a=$a vidaHeal=$vidaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 100 ]
				then
				awk '$1==a{$8=manaHeal}1' a=$a manaHeal=$manaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Mage" ]
			then
				if [ $vida -gt 30 ]
				then
				awk '$1==a{$7=vidaMage}1' a=$a vidaMage=$vidaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 130 ]
				then
				awk '$1==a{$8=manaMage}1' a=$a manaMage=$manaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ $vida -lt 0 ]
				then
				awk '$1==a{$7=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $mana -lt 0 ]
				then
				awk '$1==a{$8=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $vida -eq 0 ]
				then
		
				awk '$1==a{$7+=vidademort}1' a=$a vidademort=$vidademort usuaris.txt >file.txt
					mv file.txt usuaris.txt
					echo -e " \e[0;33m$nom is dead\e[0m "	
				        random=$(($RANDOM%8))
					ElCastic=`cat ActivitatsDeMort.txt | grep -w ^$random | cut -d ":" -f 2`
					echo -e "$ElCastic"
					read adefgbwsehjgbhwjegynWEB
			fi
	
			let nivell=$xp/1000
			awk '$1==a{$5=nivell}1' a=$a nivell=$nivell usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			;;
		
		3)
			echo -e :Num:Name:::Hp | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaVida=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 7`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;31m$vistaVida\e[0m" | sed 's/:/ \t /g'
			done									
			echo -n "							Who do you want to add?"	
			read a
			echo -n "							How much do you want to add?"			
			read q				
			awk '$1==a{$7+=q}1' a=$a q=$q usuaris.txt >file.txt
			mv file.txt usuaris.txt
			echo -e :Num:Name:::Hp | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaVida=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 7`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;31m$vistaVida\e[0m" | sed 's/:/ \t /g'
			done						
			presona=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			temps=`date`
			echo "$temps $presona get $q hp" >> Historial.txt
			vidademort=10	
			vidaWarr=80
			manaWarr=80
			vidaHeal=50
			manaHeal=100
			vidaMage=30
			manaMage=130
			zero=0
			numero=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 1`
			nom=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			clase=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 3`
			equip=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 4`
			nivell=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 5`
			xp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 6`
			vida=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 7`
			mana=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 8`
			rp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 9`
			if [ "$clase" = "Warr" ]
			then
				if [ $vida -gt 80 ]
				then
				awk '$1==a{$7=vidaWarr}1' a=$a vidaWarr=$vidaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 80 ]
				then
				awk '$1==a{$8=manaWarr}1' a=$a manaWarr=$manaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Heal" ]
			then
				if [ $vida -gt 50 ]
				then
				awk '$1==a{$7=vidaHeal}1' a=$a vidaHeal=$vidaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 100 ]
				then
				awk '$1==a{$8=manaHeal}1' a=$a manaHeal=$manaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Mage" ]
			then
				if [ $vida -gt 30 ]
				then
				awk '$1==a{$7=vidaMage}1' a=$a vidaMage=$vidaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 130 ]
				then
				awk '$1==a{$8=manaMage}1' a=$a manaMage=$manaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ $vida -lt 0 ]
				then
				awk '$1==a{$7=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $mana -lt 0 ]
				then
				awk '$1==a{$8=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $vida -eq 0 ]
				then
		
				awk '$1==a{$7+=vidademort}1' a=$a vidademort=$vidademort usuaris.txt >file.txt
					mv file.txt usuaris.txt
					echo -e " \e[0;33m$nom is dead\e[0m "	
				        random=$(($RANDOM%8))
					ElCastic=`cat ActivitatsDeMort.txt | grep -w ^$random | cut -d ":" -f 2`
					echo -e "$ElCastic"
					read adefgbwsehjgbhwjegynWEB
			fi
	
			let nivell=$xp/1000
			awk '$1==a{$5=nivell}1' a=$a nivell=$nivell usuaris.txt >file.txt
					mv file.txt usuaris.txt				
			;;
		4)
			echo -e :Num:Name:::Hp | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaVida=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 7`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;31m$vistaVida\e[0m" | sed 's/:/ \t /g'
			done					
			echo -n "						Who do you want to remove?"	
			read a
			echo -n "						How much do you want to remove?"			
			read q				
			awk '$1==a{$7-=q}1' a=$a q=$q usuaris.txt >file.txt
			mv file.txt usuaris.txt
			echo -e :Num:Name:::Hp | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaVida=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 7`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;31m$vistaVida\e[0m" | sed 's/:/ \t /g'
			done							
			presona=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			temps=`date`
			echo "$temps $presona lose $q hp" >> Historial.txt
			vidademort=10	
			vidaWarr=80
			manaWarr=80
			vidaHeal=50
			manaHeal=100
			vidaMage=30
			manaMage=130
			zero=0
			numero=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 1`
			nom=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			clase=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 3`
			equip=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 4`
			nivell=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 5`
			xp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 6`
			vida=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 7`
			mana=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 8`
			rp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 9`
			if [ "$clase" = "Warr" ]
			then
				if [ $vida -gt 80 ]
				then
				awk '$1==a{$7=vidaWarr}1' a=$a vidaWarr=$vidaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 80 ]
				then
				awk '$1==a{$8=manaWarr}1' a=$a manaWarr=$manaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Heal" ]
			then
				if [ $vida -gt 50 ]
				then
				awk '$1==a{$7=vidaHeal}1' a=$a vidaHeal=$vidaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 100 ]
				then
				awk '$1==a{$8=manaHeal}1' a=$a manaHeal=$manaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Mage" ]
			then
				if [ $vida -gt 30 ]
				then
				awk '$1==a{$7=vidaMage}1' a=$a vidaMage=$vidaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 130 ]
				then
				awk '$1==a{$8=manaMage}1' a=$a manaMage=$manaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ $vida -lt 0 ]
				then
				awk '$1==a{$7=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $mana -lt 0 ]
				then
				awk '$1==a{$8=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $vida -eq 0 ]
				then
		
				awk '$1==a{$7+=vidademort}1' a=$a vidademort=$vidademort usuaris.txt >file.txt
					mv file.txt usuaris.txt
					echo -e " \e[0;33m$nom is dead\e[0m "	
				        random=$(($RANDOM%8))
					ElCastic=`cat ActivitatsDeMort.txt | grep -w ^$random | cut -d ":" -f 2`
					echo -e "$ElCastic"
					read adefgbwsehjgbhwjegynWEB
			fi
	
			let nivell=$xp/1000
			awk '$1==a{$5=nivell}1' a=$a nivell=$nivell usuaris.txt >file.txt
					mv file.txt usuaris.txt		
			;;	
		5)
			echo -e :Num:Name:::Mn | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaMana=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 8`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;34m$vistaMana\e[0m" | sed 's/:/ \t /g'
			done						
			echo -n "							Who do you want to add?"	
			read a
			echo -n "							How much do you want to add?"			
			read q				
			awk '$1==a{$8+=q}1' a=$a q=$q usuaris.txt >file.txt
			mv file.txt usuaris.txt
			echo -e :Num:Name:::Mn | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaMana=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 8`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;34m$vistaMana\e[0m" | sed 's/:/ \t /g'
			done
			presona=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			temps=`date`
			echo "$temps $presona get $q mn" >> Historial.txt
			vidademort=10	
			vidaWarr=80
			manaWarr=80
			vidaHeal=50
			manaHeal=100
			vidaMage=30
			manaMage=130
			zero=0
			numero=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 1`
			nom=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			clase=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 3`
			equip=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 4`
			nivell=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 5`
			xp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 6`
			vida=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 7`
			mana=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 8`
			rp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 9`
			if [ "$clase" = "Warr" ]
			then
				if [ $vida -gt 80 ]
				then
				awk '$1==a{$7=vidaWarr}1' a=$a vidaWarr=$vidaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 80 ]
				then
				awk '$1==a{$8=manaWarr}1' a=$a manaWarr=$manaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Heal" ]
			then
				if [ $vida -gt 50 ]
				then
				awk '$1==a{$7=vidaHeal}1' a=$a vidaHeal=$vidaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 100 ]
				then
				awk '$1==a{$8=manaHeal}1' a=$a manaHeal=$manaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Mage" ]
			then
				if [ $vida -gt 30 ]
				then
				awk '$1==a{$7=vidaMage}1' a=$a vidaMage=$vidaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 130 ]
				then
				awk '$1==a{$8=manaMage}1' a=$a manaMage=$manaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ $vida -lt 0 ]
				then
				awk '$1==a{$7=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $mana -lt 0 ]
				then
				awk '$1==a{$8=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $vida -eq 0 ]
				then
		
				awk '$1==a{$7+=vidademort}1' a=$a vidademort=$vidademort usuaris.txt >file.txt
					mv file.txt usuaris.txt
					echo -e " \e[0;33m$nom is dead\e[0m "	
				        random=$(($RANDOM%8))
					ElCastic=`cat ActivitatsDeMort.txt | grep -w ^$random | cut -d ":" -f 2`
					echo -e "$ElCastic"
					read adefgbwsehjgbhwjegynWEB
			fi
	
			let nivell=$xp/1000
			awk '$1==a{$5=nivell}1' a=$a nivell=$nivell usuaris.txt >file.txt
					mv file.txt usuaris.txt				
			;;
		6)
			echo -e :Num:Name:::Mn | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaMana=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 8`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;34m$vistaMana\e[0m" | sed 's/:/ \t /g'
			done
			echo -n "						Who do you want to remove?"	
			read a
			echo -n "						How much do you want to remove?"			
			read q				
			awk '$1==a{$8-=q}1' a=$a q=$q usuaris.txt >file.txt
			mv file.txt usuaris.txt
			echo -e :Num:Name:::Mn | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaMana=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 8`
			ColorNumero=`echo -e " \e[0;36m$vistaNumero\e[0m "` 
			ColorNom=`echo -e " \e[0;36m$vistaNom\e[0m "` 
			ColorMana=`echo -e " \e[0;34m$vistaMana\e[0m "`
		
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;34m$vistaMana\e[0m" | sed 's/:/ \t /g'
			done	
			presona=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			temps=`date`
			echo "$temps $presona lose $q mn" >> Historial.txt
			vidademort=10	
			vidaWarr=80
			manaWarr=80
			vidaHeal=50
			manaHeal=100
			vidaMage=30
			manaMage=130
			zero=0
			numero=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 1`
			nom=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 2`
			clase=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 3`
			equip=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 4`
			nivell=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 5`
			xp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 6`
			vida=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 7`
			mana=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 8`
			rp=`cat usuaris.txt | grep -w ^$a | cut -d " " -f 9`
			if [ "$clase" = "Warr" ]
			then
				if [ $vida -gt 80 ]
				then
				awk '$1==a{$7=vidaWarr}1' a=$a vidaWarr=$vidaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 80 ]
				then
				awk '$1==a{$8=manaWarr}1' a=$a manaWarr=$manaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Heal" ]
			then
				if [ $vida -gt 50 ]
				then
				awk '$1==a{$7=vidaHeal}1' a=$a vidaHeal=$vidaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 100 ]
				then
				awk '$1==a{$8=manaHeal}1' a=$a manaHeal=$manaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Mage" ]
			then
				if [ $vida -gt 30 ]
				then
				awk '$1==a{$7=vidaMage}1' a=$a vidaMage=$vidaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 130 ]
				then
				awk '$1==a{$8=manaMage}1' a=$a manaMage=$manaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ $vida -lt 0 ]
				then
				awk '$1==a{$7=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $mana -lt 0 ]
				then
				awk '$1==a{$8=zero}1' a=$a zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $vida -eq 0 ]
				then
		
				awk '$1==a{$7+=vidademort}1' a=$a vidademort=$vidademort usuaris.txt >file.txt
					mv file.txt usuaris.txt
					echo -e " \e[0;33m$nom is dead\e[0m "	
				        random=$(($RANDOM%8))
					ElCastic=`cat ActivitatsDeMort.txt | grep -w ^$random | cut -d ":" -f 2`
					echo -e "$ElCastic"
					read adefgbwsehjgbhwjegynWEB
			fi
	
			let nivell=$xp/1000
			awk '$1==a{$5=nivell}1' a=$a nivell=$nivell usuaris.txt >file.txt
					mv file.txt usuaris.txt		
			;;			
		*)
		        echo "______________________________________________________________Not found________________________________________________________________"
			;;	
		esac

