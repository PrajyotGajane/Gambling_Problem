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

#UC 3 logic
echo
echo "UC 3"
declare -a arr
upper=150
lower=50
ammount=0
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
if [[ $dummy_stake -eq "150" ]]
then
	echo "Won : $(($dummy_stake - $stake))$"
else
	echo "Lost : $dummy_stake$"
fi
