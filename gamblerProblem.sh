echo "Welcome to the gambling simultation program"
stake=100
gambler_stake=100
won=0
lost=0
bet=$((RANDOM % 2))
if [[ $bet -eq 1 ]]
then
    let "won+=1"
else
    let "lost+=1"
fi
echo "Won : $won$"
echo "Lost : $lost$"

#UC 3 logic updated to UC 4
echo
declare -a day
upper=150
lower=50
ammount=0

days=20
for (( i=0; i<$days; i++))
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
	else
		echo "Lost on day $i : $elements"
	fi
	value=${day[$i-1]}
done

echo "Total amount left with the gambler = ${day[$i-1]}"

