#!/bin/bash
n=$(($RANDOM%8))
echo -e "\e[0;1m______________________________________________________________________________________________________________________________________\e[0;00m\n"
echo
case $n in
	0)
echo -e "\e[0;34m_________________________________________________\e[0m \e[1;34mDance a song chosen by the students\e[0m \e[0;34m________________________________________________\e[0m"
;;
	1)
echo -e "\e[0;32m_____________________________________________________\e[0m \e[1;32mImitate one popular character\e[0m \e[0;32m__________________________________________________\e[0m"
;;
	2)
echo -e "\e[0;36m___________________________________________________________\e[0m \e[1;36mTell a joke\e[0m \e[0;36m______________________________________________________________\e[0m"
;;
	3)
echo -e "\e[0;31m_____________________________________________________\e[0m \e[1;31mHear a joke of David in the ear\e[0m \e[0;31m________________________________________________\e[0m"
;;
	4)
echo -e "\e[0;35m_______________________________________________________\e[0m \e[1;35mSing the song you want\e[0m \e[0;35m_______________________________________________________\e[0m"
;;
	5)
echo -e "\e[0;33m______________________________________________________\e[0m \e[0;33mBe riddled with beatings\e[0m \e[0;33m______________________________________________________\e[0m"
;;
	6)
echo -e "\e[1;33m_____________________________________________________\e[0m \e[1;33mA work of 100 in small print\e[0m \e[1;33m___________________________________________________\e[0m"
;;
	7)
echo -e "\e[0;37m________________________________________________________________\e[0m \e[0;37mNothing\e[0m \e[0;37m_____________________________________________________________\e[0m"
;; 
esac
echo -e "\e[0;1m______________________________________________________________________________________________________________________________________\e[0;00m\n"
echo 
echo "                                                           Press enter to exit"
read n
