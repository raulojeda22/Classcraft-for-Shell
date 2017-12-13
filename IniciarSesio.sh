#!/bin/bash
clear
echo -e :Num::Name | sed 's/:/ \t /g'
numus=`cat usuaris.txt | wc -l`
for n in `seq $numus`
do
Miraro=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
Miraro2=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
ColorMirar=`echo -e " \e[0;33m$Miraro\e[0m "`
ColorMirar2=`echo -e " \e[0;36m$Miraro2\e[0m "`
echo -e :$ColorMirar::$ColorMirar2 | sed 's/:/ \t /g'
done
echo -e "\e[0;32m______________________________________________________________________________________________________________________________________\e[0m"
echo
echo -n "                                                       Write your account number:"
read agafanoms
elnom=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 2`
contrasenyareal=`cat contrasenyes.txt | grep -w ^$elnom | cut -d " " -f 2`
echo
echo -n "                                                              Password:"
read contrasenyaposada
if [ "$contrasenyaposada" = "$contrasenyareal" ]
then
echo $agafanoms > ELNOM.txt
clase=`cat usuaris.txt | grep -w ^$agafanoms | cut -d " " -f 3`
echo $clase
case $clase in
		Warr)
		./CuentaWarr.sh
		;;
		Mage)
		./CuentaMage.sh
		;;
		Heal)
		./CuentaHeal.sh
		;;
esac
else
echo -e "                                                            \e[1;31mWrong password\e[0m"
fi
