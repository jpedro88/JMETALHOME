#echo "------------------------melhor: $3------------------------"
cmd=$(echo $1 | R --no-save | grep p-value)
p=$(echo $cmd | cut -d' ' -f6 | sed 's/[eE]+*/*10^/g')

#echo "("$2")"

if [ $(echo "$p < 0.05" | bc) = "1" ];then
	bool="diff=TRUE"
	#if [ "$2" -ne "1" ];then
	#	echo $cmd $bool
	#fi
	#echo $cmd $bool
	echo "1-$2" $cmd $bool
else
	bool="diff=FALSE"
	#echo $cmd $bool
fi



#echo $1 | R --no-save | grep p-value | tail -$(echo "$2+1" | bc) | head -$(echo "$2" | bc) | grep -E "$3-|\-$3" | grep FALSE
#echo "----------------------------------------------------------"
