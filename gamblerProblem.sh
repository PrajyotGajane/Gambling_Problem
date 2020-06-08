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
