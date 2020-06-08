#!/bin/bash -x
echo "Welcome to the gambling simultation program"
echo
work=1
function start(){
stake=100
gambler_stake=100
won=0
lost=0
default=0
bet=$((RANDOM % 2))
if [[ $bet -eq 1 ]]
then
    let "won+=1"
else
    let "lost+=1"
fi
echo "Won : $won$"
echo "Lost : $lost$"

#UC 3 logic updated to UC 4 updated to UC 5
echo
declare -a day
upper=150
lower=50
ammount=0
month=30
days=20
daysWon=0
daysLost=0
for (( i=0; i<$month; i++))
do
	dummy_stake=$stake
	while [[ $dummy_stake -gt $lower && $dummy_stake -lt $upper  ]]
	do
        	bet=$(( RANDOM % 2 ))
        	if [[ $bet -eq 1 ]]
        	then
                	let "dummy_stake+=1"
		else
        	        let "dummy_stake-=1"
       		fi
	done
	let "ammount+=$(($stake-$dummy_stake))"
	day[$i]=$(($ammount))
done
i=0;
value=0
for elements in ${day[@]}
do
	let "i+=1"
	if [[ $elements -gt $value ]]
	then
		echo "Won on day $i : $elements$"
		let "daysWon+=1"
	else
		echo "Lost on day $i : $elements"
		let "daysLost+=1"
	fi
	value=${day[$i-1]}
done

echo
echo "Total amount left with the gambler = ${day[$i-1]}"
echo "Total days gamber won is $daysWon and lost is $daysLost"
if [[ $ammount -lt $default ]]
then
	echo "Lost by $ammount$"
else
	echo "Won by $ammount$"
fi
#UC 6 implementation
MAX=${day[0]}
declare -a lucky
declare -a unlucky
j=0
k=0
MIN=${day[0]}
for (( i=0; i<$month; i++ ))
do
	if [[ ${day[$i]} -ge $MAX ]]
	then
		#echo "MAX loop running ---------------"
		MAX=${day[$i]}
		lucky[$j]=$(($i))
		let "j+=1"
	fi
	if [[ ${day[$i]} -le $MIN ]]
	then
		#echo "MIN loop running ----------------"
		MIN=${day[$i]}
		unlucky[$k]=$(($i))
		let "k+=1"
	fi
done
echo
for element1 in ${lucky[@]}
do
	if [[ $MAX -eq ${day[$element1]} ]]
	then
	echo "Lukiest day is $(($element1+1))"
	fi
done
echo
for element2 in ${unlucky[@]}
do
	if [[ $MIN -eq ${day[$element2]} ]]
	then
	echo "Unlukiest day is $(($element2+1))"
	fi
done
}

#UC & logic below
while [[ $work -gt 0 ]]
do
	start
	if [[ $daysWon -gt $daysLost ]]
	then
		echo "You won $ammount, do you want to continue ?"
		echo "Press 1 for yes 2 for no"
		read n
		case $n in
			1)
			start
			;;
			2)
			work=-1
			break
			;;
		esac
	else
		work=-1
	fi
done
