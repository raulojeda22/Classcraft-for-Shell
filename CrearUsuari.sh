#!/bin/bash
clear
codigocero=0
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;34mAvailable Classes\e[0m \e[0;34m_______________________________________________________________\e[0m"
echo -e "
		             \e[0m \e[1;31mWarr\e[0m                                \e[0m \e[1;34mMage\e[0m                               \e[0m \e[1;32mHeal\e[0m

	"
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;34mAvailable Teams\e[0m \e[0;34m_________________________________________________________________\e[0m"
echo -e "
			     \e[0m \e[1;33mTop\e[0m				  \e[0m \e[1;36mMid\e[0m				      \e[0m \e[1;30mBot\e[0m	

	"
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;34mName of new user\e[0m \e[0;34m_________________________________________________________________\e[0m"
read us
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;34mTeam you want to enter\e[0m \e[0;34m___________________________________________________________\e[0m"
read eq	
case $eq in
		Top)
		eq=Top
		;;
		Mid)
		eq=Mid
		;;
		Bot)
		eq=Bot
		;;
		*)
		echo "That team don't exist"
		echo -n "Press Enter...."
		read asdghwehf
		./CrearUsuari.sh
		;;
esac
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;34mClass you want\e[0m \e[0;34m_________________________________________________________________\e[0m"
read cl
case $cl in
		Warr)
			vi=80
			mn=80
			;;		
		Mage)
			vi=30
			mn=130
			;;
		Heal)
			vi=50
			mn=100
			;;
		*)
			echo "Que haces puto LOCOOOOOOOOO"
			echo -n "Press Enter...."
		        read asdghwehf
			./CrearUsuari.sh
			;;
esac
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;34mPassword\e[0m \e[0;34m________________________________________________________________________\e[0m"
read contr
numero=`cat usuaris.txt | wc -l`
let numero=$numero+1
echo "$numero $us $cl $eq $codigocero $codigocero $vi $mn $codigocero" >> usuaris.txt
echo "$us $contr" >> contrasenyes.txt
echo -e "\e[0;34m____________________________________________________________\e[0m \e[1;34mYou account has been created Welcome $us\e[0m \e[0;34m____________________________________\e[0m"
echo -e " \e[0;34mDo you want enter in your account now?\e[0m"
echo -e " \e[0;32mYes\e[0m or \e[0;31mNo\e[0m?"
read respuesta
case $respuesta in
		Yes)
		./IniciarSesio.sh
		;;
		No)
		./Classcraft.sh
		;;
		*)
		./Classcraft.sh
		;;
esac

