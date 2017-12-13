#!/bin/bash
clear
numus=`cat usuaris.txt | wc -l`
for n in `seq $numus`
do
				
		
	q=10		
			awk '$1==n{$6+=q}1' n=$n q=$q usuaris.txt >file.txt
			mv file.txt usuaris.txt
			awk '$1==n{$7+=q}1' n=$n q=$q usuaris.txt >file.txt
			mv file.txt usuaris.txt
				
					
done
			echo -e :Num:Name:::Hp:Mn | sed 's/:/ \t /g'
			numus=`cat usuaris.txt | wc -l`
			for n in `seq $numus`
			do
			vistaNumero=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 1`
			vistaNom=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 2`
			vistaHp=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 7`
			vistaMn=`cat usuaris.txt | grep -w ^$n | cut -d " " -f 8`	
			echo -e ":\e[0;36m$vistaNumero\e[0m:\e[0;36m$vistaNom\e[0m::\e[0;31m$vistaHp\e[0m:\e[0;34m$vistaHp\e[0m" | sed 's/:/ \t /g'
			done
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
			done
