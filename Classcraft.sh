#!/bin/bash
clear
function menu {
clear
echo
echo "......................................................................................................................................"
echo -e "                                                         \e[0;1mCLASS OF LEGENDS\e[0;00m\n" "......................................................................................................................................"
echo
echo "______________________________________________________________________________________________________________________________________"
echo
echo -e "\e[0;34m__________________________________________________________\e[0m \e[1;34m1.Create user\e[0m \e[0;34m_____________________________________________________________\e[0m"
echo
echo -e "\e[0;32m__________________________________________________________\e[0m \e[1;32m2.View events\e[0m \e[0;32m_____________________________________________________________\e[0m"
echo
echo -e "\e[0;36m__________________________________________________________\e[0m \e[1;36m3.XP,HP and Mn\e[0m \e[0;36m____________________________________________________________\e[0m"
echo
echo -e "\e[0;31m_________________________________________________________\e[0m \e[1;31m4.Spend a day\e[0m \e[0;31m______________________________________________________________\e[0m"
echo
echo -e "\e[0;35m__________________________________________________________\e[0m \e[1;35m5.Random event\e[0m \e[0;35m____________________________________________________________\e[0m"
echo
echo -e "\e[0;33m_________________________________________________________\e[0m \e[0;33m6.Random student\e[0m \e[0;33m___________________________________________________________\e[0m"
echo
echo -e "\e[1;33m__________________________________________________________\e[0m \e[1;33m7.Random team\e[0m \e[1;33m_____________________________________________________________\e[0m"
echo
echo -e "\e[0;32m_____________________________________________________\e[0m \e[0;32m8.Get out of Classcraft\e[0m \e[0;32m________________________________________________________\e[0m" 
echo
echo -e "\e[0;35m________________________________________________________\e[0m \e[0;35m9.Update Classcraft\e[0m \e[0;35m_________________________________________________________\e[0m" 
echo
echo -e "\e[0;34m____________________________________________________________\e[0m \e[0;34m10.Login user\e[0m \e[0;34m___________________________________________________________\e[0m" 
echo
echo -e "\e[0;32m__________________________________________________________\e[0m \e[1;32m11.See Historial\e[0m \e[0;32m__________________________________________________________\e[0m"
echo "______________________________________________________________________________________________________________________________________"
echo
echo :Num:Name:::Rol:Team:Level:XP:HP:MN:RP | sed 's/:/ \t /g'
numus=`cat usuaris.txt | wc -l`

for n in `seq $numus`
do
	
	vidademort=10	
	vidaWarr=80
	manaWarr=80
	vidaHeal=50
	manaHeal=100
	vidaMage=30
	manaMage=130
	zero=0
	numero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
	nom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
	clase=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 3`
	equip=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 4`
	nivell=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 5`
	xp=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 6`
	vida=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 7`
	mana=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 8`
	rp=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 9`
	if [ "$clase" = "Warr" ]
	then
		if [ $vida -gt 80 ]
		then
		awk '$1==n{$7=vidaWarr}1' n=$n vidaWarr=$vidaWarr usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
		if [ $mana -gt 80 ]
		then
		awk '$1==n{$8=manaWarr}1' n=$n manaWarr=$manaWarr usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
	fi
	if [ "$clase" = "Heal" ]
	then
		if [ $vida -gt 50 ]
		then
		awk '$1==n{$7=vidaHeal}1' n=$n vidaHeal=$vidaHeal usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
		if [ $mana -gt 100 ]
		then
		awk '$1==n{$8=manaHeal}1' n=$n manaHeal=$manaHeal usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
	fi
	if [ "$clase" = "Mage" ]
	then
		if [ $vida -gt 30 ]
		then
		awk '$1==n{$7=vidaMage}1' n=$n vidaMage=$vidaMage usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
		if [ $mana -gt 130 ]
		then
		awk '$1==n{$8=manaMage}1' n=$n manaMage=$manaMage usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		fi
	fi
	if [ $vida -lt 0 ]
		then
		awk '$1==n{$7=zero}1' n=$n zero=$zero usuaris.txt >file.txt
			mv file.txt usuaris.txt	
	fi
	if [ $mana -lt 0 ]
		then
		awk '$1==n{$8=zero}1' n=$n zero=$zero usuaris.txt >file.txt
			mv file.txt usuaris.txt	
	fi
	if [ $vida -eq 0 ]
		then
		
		awk '$1==n{$7+=vidademort}1' n=$n vidademort=$vidademort usuaris.txt >file.txt
			mv file.txt usuaris.txt	
		echo -e " \e[0;33m$nom is dead\e[0m "	
		random=$(($RANDOM%8))
		ElCastic=`cat ActivitatsDeMort.txt | grep -w ^$random | cut -d ":" -f 2`
		echo -e "$ElCastic"
		read adefgbwsehjgbhwjegynWEB
	fi
	
	let nivell=$xp/1000
	awk '$1==n{$5=nivell}1' n=$n nivell=$nivell usuaris.txt >file.txt
			mv file.txt usuaris.txt
	echo -e ":\e[0;33m$numero \e[0m:\e[0;36m$nom\e[0m::\e[0;35m$clase\e[0m:\e[0;35m$equip\e[0m:\e[0;33m$nivell\e[0m:\e[0;33m$xp\e[0m:\e[0;31m$vida\e[0m:\e[0;34m$mana\e[0m:\e[0;33m$rp\e[0m" > visualitzarusuaris.txt
	cat visualitzarusuaris.txt | sed 's/:/ \t /g'
	
done 

buclecase=1
while [ $buclecase -eq 1 ]
do
	echo -n "                                                          Select a section: "
	read n
	
	

	case $n in
		1)
			./CrearUsuari.sh
			;;
		2)
			cat Events.txt | cut -d ":" -f 2
			echo -e " \e[0;33mWould you like to add an event?\e[0m "
			read Contestacio
			case $Contestacio in
				Yes)
				echo -n "Enter the new event:"
				read NewEvent
				NumeroEvents=`cat Events.txt | wc -l`
				echo "$NumeroEvents:$NewEvent" >> Events.txt
				echo -e " \e[0;32mCongratulations your new event has been added\e[0m "
				;;
				yes)
				echo -n "Enter the new event:"
				read NewEvent
				NumeroEvents=`cat Events.txt | wc -l`
				echo "$NumeroEvents:$NewEvent" >> Events.txt
				echo -e " \e[0;32mCongratulations your new event has been added\e[0m "
				;;
			esac				
			;;
		3)
			./XP.sh
			;;
		4)
			./PassarDia.sh
			;;
		5)
			./eventaleatoriInglés.sh
			;;
		6)
			./alumnealeatori.sh
			;;
		7)
			./equipaleatori.sh
			;;
		8)			
			clear			
			exit			
			;;
		9)			
			echo
			
			echo -n "                                         Press Enter...."
			read n
			menu
			;;
		10)
			./IniciarSesio.sh
			;;
		11)
			cat Historial.txt
			;;
		*)
			echo
			echo -e "                                                      \e[0;31mIncorrect Option!\e[0m "
			read n
			menu
			;;
	esac
done
}


menu
clear


