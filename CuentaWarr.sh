#!/bin/bash
clear
agafanoms=`cat ELNOM.txt`
buclepower=1
while [ $buclepower -eq 1 ]
do
	clear
	echo -e "\e[0;1m______________________________________________________________________________________________________________________________________\e[0;00m\n"
	echo -e "\e[0;34m___________________________________________________________\e[0m \e[1;34m1. Information\e[0m \e[0;34m___________________________________________________________\e[0m"	
	echo
	echo -e "\e[0;32m_______________________________________________________________\e[0m \e[1;32m2. Shop\e[0m \e[0;32m______________________________________________________________\e[0m"
	echo	
	echo -e "\e[0;36m______________________________________________________________\e[0m \e[1;36m3. Powers\e[0m \e[0;36m_____________________________________________________________\e[0m"
	echo
	echo -e "\e[0;31m_______________________________________________________________\e[0m \e[1;31m4. Exit\e[0m \e[0;31m______________________________________________________________\e[0m"
	echo
	echo -e "\e[0;35m_______________________________________________________________\e[0m \e[1;35m5. Play\e[0m \e[0;35m______________________________________________________________\e[0m"
	echo
	echo -e "\e[0;1m______________________________________________________________________________________________________________________________________\e[0;00m\n"
	read eleccio
	case $eleccio in 
			1)
			clear
			vida=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 7`
			mana=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 8`
			xp=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 6`
			rp=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 9`
			nom=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 2`
			equip=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 4`
			MiVida=`echo -e "\e[0;31m____________________________________________________________\e[0m \e[1;31mCurrent Health:$vida\e[0m "`
			echo -n "$MiVida"
			BarraVida=`cat LaBarraManaiVidaWarr.txt | grep -w ^$vida | cut -d " " -f 2`
			echo -e " \e[0;31m$BarraVida\e[0m "
			echo                       
			manavista=`echo -e "\e[0;34m_____________________________________________________________\e[0m \e[1;34mCurrent Mana:$mana\e[0m"`
			echo -n "$manavista"
			BarraMana=`cat LaBarraManaiVidaWarr.txt | grep -w ^$mana | cut -d " " -f 2`
			echo -e " \e[0;34m$BarraMana\e[0m "
			echo                               
			echo -e "\e[0;33m______________________________________________________________\e[0m \e[1;33mCurrent XP:$xp\e[0m \e[0;33m___________________________________________________________\e[0m"
			echo			
			echo -e "\e[0;30m______________________________________________________________\e[0m \e[1;30mCurrent RP:$rp\e[0m \e[0;30m___________________________________________________________\e[0m"  
			echo                    
			echo -e "\e[0;35m_________________________________________________________________\e[0m \e[1;35mName:$nom\e[0m \e[0;35m______________________________________________________\e[0m"
			echo                                      
			echo -e "\e[1;36m_________________________________________________________________\e[0m \e[1;36mTeam:$equip\e[0m \e[1;36m______________________________________________________________\e[0m"                                 
			echo "

											  ,dM 
											 dMMP 
											dMMMº 
											\MM/ 
											dMMm. 
										       dMMP'_\---. 
										      _| _  p ;88;º. 
										    ,db; p >  ;8P|  º. 
										   (ººT8b,__,ºdP |   | 
										   |   ºY8b..dP  ;_  | 
										   |    |ºT88P_ /  º\; 
										   :_.-~|d8PººY/    / 
										    \_   TP    ;   7º\ 
									 ,,__        >   º._  /º  /   º\_ 
									 º._ ºººº~~~~------|º\;º ;     ,º 
									    ººº~~~-----~~~º\__[|;º _.-º  º\ 
										    ;--..._     .-º-._     ; 
										   /      /º~~ºº   ,ºº\_ ,/ 
										  ;_    /º        /    ,/ 
										  | º~-l         ;    / 
										  º\    ;       /\.._| 
										    \    \      \     \ 
										    /º---º;      º----º 
										   (     /                
										    º---ºº 
				"                                                  
                  
			echo -n "Pulsa Intro....."
	                read jhfsa 
			;;
			2)
			./Tenda.sh
			;;
			3)
			./warr.sh
			;;
			4)
			buclepower=2
			;;
			5)
			./Snake.sh
			;;
			*)
			echo "Pero MADREMIA ESQUE NO SAS LLEGIR CASURRO EN CAP DE PLAT DE BLEDES"
			;;
	esac
done
./Classcraft.sh
