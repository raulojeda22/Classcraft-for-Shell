#!/bin/bash
clear
agafanoms=`cat ELNOM.txt`
echo -e "		       
				                     \e[1;31m▒▒▒ ▒▒▒ ▒   ▒ ▒▒▒ ▒▒▒  ▒▒▒
				                     ▒ ▒ ▒ ▒ ▒   ▒ ▒   ▒ ▒  ▒	
_____________________________________________________▒▒▒ ▒ ▒ ▒   ▒ ▒▒▒ ▒▒▒  ▒▒▒_______________________________________________________
				   	             ▒   ▒ ▒ ▒ ▒ ▒ ▒   ▒ ▒    ▒
				   	             ▒   ▒▒▒ ▒▒ ▒▒ ▒▒▒ ▒  ▒ ▒▒▒\e[0m		"
echo
echo -e "\e[0;34m__________________________________________________________\e[0m \e[1;34m1.Mega Impact\e[0m \e[0;34m_____________________________________________________________\e[0m"
echo -e "
	                                 \e[0;34mCost:30Mn\e[0m          \e[0;31mDamage:10Hp\e[0m          \e[0;33mReward:100Xp\e[0m

	"
echo -e "\e[0;34m__________________________________________________________\e[0m \e[1;34m2.First aid kit\e[0m \e[0;34m___________________________________________________________\e[0m"
echo -e "
					 \e[0;34mCost:30Mn\e[0m          \e[0;32mHeal:10Hp\e[0m            \e[0;33mReward:100Xp\e[0m

	"

echo -e "\e[0;34m__________________________________________________________\e[0m \e[1;34m3.Mysterious Dice\e[0m \e[0;34m_________________________________________________________\e[0m"
echo -e "

						           \e[0;33mReward:-200/200Xp\e[0m


	"
echo -e "\e[0;34m__________________________________________________________\e[0m \e[1;34m4.Courage\e[0m \e[0;34m_________________________________________________________________\e[0m"
echo -e "

		               \e[0;32mLife=1\e[0m             \e[0;34mMana=1\e[0m             \e[0;33mReward:200Xp\e[0m                \e[0;33mReward:200Rp\e[0m


	"
echo -e "\e[0;34m__________________________________________________________\e[0m \e[1;34m5.Exit\e[0m \e[0;34m____________________________________________________________________\e[0m"
read p
case $p in
		1)
		echo -e :Num:Role::Team:HP:MN:Name | sed 's/:/ \t /g'
					numus=`cat usuaris.txt | wc -l`
					for n in `seq $numus`
					do
					vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
					vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
					vistaClase=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 3`
					vistaEquip=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 4`
					vistaVida=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 7`
					vistaMana=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 8`
					ColorNumero=`echo -e " \e[0;36m$vistaNumero\e[0m "` 
					ColorNom=`echo -e " \e[0;36m$vistaNom\e[0m "` 
					ColorClase=`echo -e " \e[0;35m$vistaClase\e[0m "`
					ColorEquip=`echo -e " \e[0;33m$vistaEquip\e[0m "`
					ColorVida=`echo -e " \e[0;31m$vistaVida\e[0m "`
					ColorMana=`echo -e " \e[0;34m$vistaMana\e[0m "`
		
					echo -e :$ColorNumero:$ColorClase:$ColorEquip:$ColorVida:$ColorMana:$ColorNom | sed 's/:/ \t /g'
					done							
			echo -n "Who you want to attack?"	
			read numero
			mal=10	
			mana=30	
			xp=100
			persona=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 4`
			tu=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 4`
			pos=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 8`
			if [ "$pos" -lt "$mana" ]
			then
			echo "You do not have enough mana"
			echo -n "Press Enter...."
			read gilverto
			else
			if [ "$persona" = "$tu" ]
			then
			echo -e " \e[0;31mCareful if you attack your ally you can do damage\e[0m "
			echo -n "Press Enter...."
			read hrejgesuryhe
			else
			awk '$1==numero{$7-=mal}1' numero=$numero mal=$mal usuaris.txt >file.txt
			mv file.txt usuaris.txt
			awk '$1==agafanoms{$8-=mana}1' agafanoms=$agafanoms mana=$mana usuaris.txt >file.txt
			mv file.txt usuaris.txt
			awk '$1==agafanoms{$6+=xp}1' agafanoms=$agafanoms xp=$xp usuaris.txt >file.txt
			mv file.txt usuaris.txt
			presona=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 2`
			latre=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 2`
			temps=`date`
		        echo "$temps $presona atack $latre and he losed 10 hp" >> Historial.txt
			vidademort=10	
			vidaWarr=80
			manaWarr=80
			vidaHeal=50
			manaHeal=100
			vidaMage=30
			manaMage=130
			zero=0
			numero=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 1`
			nom=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 2`
			clase=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 3`
			equip=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 4`
			nivell=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 5`
			xp=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 6`
			vida=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 7`
			mana=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 8`
			rp=`cat usuaris.txt | grep -w ^$numero | cut -d " " -f 9`
			if [ "$clase" = "Warr" ]
			then
				if [ $vida -gt 80 ]
				then
				awk '$1==numero{$7=vidaWarr}1' numero=$numero vidaWarr=$vidaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 80 ]
				then
				awk '$1==numero{$8=manaWarr}1' numero=$numero manaWarr=$manaWarr usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Heal" ]
			then
				if [ $vida -gt 50 ]
				then
				awk '$1==numero{$7=vidaHeal}1' numero=$numero vidaHeal=$vidaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 100 ]
				then
				awk '$1==numero{$8=manaHeal}1' numero=$numero manaHeal=$manaHeal usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ "$clase" = "Mage" ]
			then
				if [ $vida -gt 30 ]
				then
				awk '$1==numero{$7=vidaMage}1' numero=$numero vidaMage=$vidaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
				if [ $mana -gt 130 ]
				then
				awk '$1==numero{$8=manaMage}1' numero=$numero manaMage=$manaMage usuaris.txt >file.txt
					mv file.txt usuaris.txt	
				fi
			fi
			if [ $vida -lt 0 ]
				then
				awk '$1==numero{$7=zero}1' numero=$numero zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $mana -lt 0 ]
				then
				awk '$1==numero{$8=zero}1' numero=$numero zero=$zero usuaris.txt >file.txt
					mv file.txt usuaris.txt	
			fi
			if [ $vida -eq 0 ]
				then
		
				awk '$1==numero{$7+=vidademort}1' numero=$numero vidademort=$vidademort usuaris.txt >file.txt
					mv file.txt usuaris.txt
					echo -e " \e[0;33m$nom is dead\e[0m "	
				        random=$(($RANDOM%8))
					ElCastic=`cat ActivitatsDeMort.txt | grep -w ^$random | cut -d ":" -f 2`
					echo -e "$ElCastic"
					read adefgbwsehjgbhwjegynWEB
			fi
	
			let nivell=$xp/1000
			awk '$1==numero{$5=nivell}1' numero=$numero nivell=$nivell usuaris.txt >file.txt
					mv file.txt usuaris.txt
			fi
			fi
			;;
		2)
			nivell=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 5`
			if [ $nivell -lt 2 ]
			then
				echo -e " \e[0;31mYou do not have enough level\e[0m "
				echo -n "Press Enter...."
				read hrejgesuryhe
			else
				
				curacio=10	
				mana=30	
				xp=100
				pos=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 8`
				if [ "$pos" -lt "$mana" ]
				then
					echo "You do not have enough mana"
					echo -n "Press Enter...."
					read gilverto
				else
					awk '$1==agafanoms{$7+=curacio}1' agafanoms=$agafanoms curacio=$curacio usuaris.txt >file.txt
					mv file.txt usuaris.txt
					awk '$1==agafanoms{$8-=mana}1' agafanoms=$agafanoms mana=$mana usuaris.txt >file.txt
					mv file.txt usuaris.txt
					awk '$1==agafanoms{$6+=xp}1' agafanoms=$agafanoms xp=$xp usuaris.txt >file.txt
					mv file.txt usuaris.txt
					presona=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 2`
					temps=`date`
					echo "$temps $presona used Botiquin and gain 10 hp and 100 xp" >> Historial.txt
				fi
			fi
			;;
					3)
					
					nivell=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 5`
			if [ $nivell -lt 3 ]
			then
				echo -e " \e[0;31mYou do not have enough level\e[0m "
				echo -n "Press Enter...."
				read hrejgesuryhe
			else					
					n=$(($RANDOM%2))
					case $n in
						0)
						random=$(($RANDOM%200))
						awk '$1==agafanoms{$6+=random}1' agafanoms=$agafanoms random=$random usuaris.txt >file.txt
						mv file.txt usuaris.txt
						echo "The luck you win $random"
						presona=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 2`						
						temps=`date`
						echo "$temps $presona win $random for the dice" >> Historial.txt 				
						;;
						1)
						random=$(($RANDOM%200))		
						awk '$1==agafanoms{$6-=random}1' agafanoms=$agafanoms random=$random usuaris.txt >file.txt	
						mv file.txt usuaris.txt
						echo "HHAHAHAHAHAHAHAHAHAHHAHAHAHAHAHAJ You lose $random noob HAHAHAHAHAHHAHAHAHAHAHA"
						presona=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 2`
						temps=`date`
						echo "$temps $presona lose $random for the dice" >> Historial.txt					
							
						;;
						2)
						echo "HAY UN ELOL DEL PLOGLAMA"
						;;
								   	esac										
						fi
						;;

		4)
			
			nivell=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 5`
			if [ $nivell -lt 4 ]
			then
				echo -e " \e[0;31mYou do not have enough level\e[0m "
				echo -n "Press Enter...."
				read hrejgesuryhe
			else
			uno=1	
			ganancia=200		
			awk '$1==agafanoms{$7=uno}1' agafanoms=$agafanoms uno=$uno usuaris.txt >file.txt
			mv file.txt usuaris.txt	
			awk '$1==agafanoms{$8=uno}1' agafanoms=$agafanoms uno=$uno usuaris.txt >file.txt
			mv file.txt usuaris.txt	
			awk '$1==agafanoms{$5+=ganancia}1' agafanoms=$agafanoms ganancia=$ganancia usuaris.txt >file.txt
			mv file.txt usuaris.txt	
			awk '$1==agafanoms{$9+=ganancia}1' agafanoms=$agafanoms ganancia=$ganancia usuaris.txt >file.txt
			mv file.txt usuaris.txt
			presona=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 2`
			temps=`date`
		        echo "$temps $presona used Valentia and gain 200 xp and 200 rp" >> Historial.txt
			fi
			;;
		5)
					echo -e " \e[0;31mComing out......\e[0m "
					read eixir
					clear
					;;
		*)
			echo
			echo -e "                                                      e[0;31mIncorrect Option!\e[0m "
			read n
			;;
esac

	vidademort=10	
	vidaWarr=80
	manaWarr=80
	vidaHeal=50
	manaHeal=100
	vidaMage=30
	manaMage=130
	zero=0
	numero=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 1`
	nom=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 2`
	clase=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 3`
	equip=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 4`
	nivell=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 5`
	xp=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 6`
	vida=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 7`
	mana=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 8`
	rp=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 9`
	if [ "$clase" = "Warr" ]
	then
		if [ $vida -gt 80 ]
		then
		awk '$1==agafanoms{$7=vidaWarr}1' agafanoms=$agafanoms vidaWarr=$vidaWarr usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
		if [ $mana -gt 80 ]
		then
		awk '$1==agafanoms{$8=manaWarr}1' agafanoms=$agafanoms manaWarr=$manaWarr usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
	fi
	if [ "$clase" = "Heal" ]
	then
		if [ $vida -gt 50 ]
		then
		awk '$1==agafanoms{$7=vidaHeal}1' agafanoms=$agafanoms vidaHeal=$vidaHeal usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
		if [ $mana -gt 100 ]
		then
		awk '$1==agafanoms{$8=manaHeal}1' agafanoms=$agafanoms manaHeal=$manaHeal usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
	fi
	if [ "$clase" = "Mage" ]
	then
		if [ $vida -gt 30 ]
		then
		awk '$1==agafanoms{$7=vidaMage}1' agafanoms=$agafanoms vidaMage=$vidaMage usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
		if [ $mana -gt 130 ]
		then
		awk '$1==agafanoms{$8=manaMage}1' agafanoms=$agafanoms manaMage=$manaMage usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
	fi
	if [ $mana -lt 0 ]
		then
		awk '$1==agafanoms{$8=zero}1' agafanoms=$agafanoms zero=$zero usuaris.txt >file.txt
			mv file.txt usuaris.txt	
	fi
	
	let nivell=$xp/1000
	awk '$1==agafanoms{$5=nivell}1' agafanoms=$agafanoms nivell=$nivell usuaris.txt >file.txt
			mv file.txt usuaris.txt

	

