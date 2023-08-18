#! /bin/bash

re='^-?[0-9]+$'

add () {
# check input validation - 2 positional arguments
	if [[ "$#" -ne "2" ]]; then
		echo "Error: You Didn't Enter 2 Arguments" >&2 
        	exit 1
        # check that first number is valid
	elif  [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number" >&2
		exit 1
	# check that second number is valid
	elif ! [[ "$2" =~ $re ]]; then
		echo "Error, $2 is not a valid number" >&2
		exit 1
	#all good, make the addition calculation. 
	else
		let result=$1+$2
		# echo back $result from the function
		echo $result
	fi
}

subtract () {
	# check input validation - 2 positional arguments
	if [[ "$#" -ne "2" ]]; then
		echo "Error: You Didn't Enter 2 Arguments" >&2 
        	exit 1
        # check that first number is valid
	elif  [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number" >&2
		exit 1
	# check that second number is valid
	elif ! [[ "$2" =~ $re ]]; then
		echo "Error, $2 is not a valid number" >&2
		exit 1
	#all good, make the subtraction calculation. 
	else
		let result=$1-$2
		# echo back $result from the function
		echo $result
    	fi
}

#### Must add functions here - Multiply, Divide, Modulus, Power-of, is_prime, is_odd_even, is_div_by_five #####


















####### Remove when finished ##########


main_function () {
	# echo all the options to the user
	options=$3
	echo "a. ${options[0]}"
	echo "b. ${options[1]}"
	echo "c. ${options[2]}"
	echo "d. ${options[3]}"
	echo "e. ${options[4]}"
	echo "f. ${options[5]}"
	echo "g. ${options[6]}"
	# read input from user
	read var
	# check user input
	case $var in
		"a"|"Add"|"add")
			result=$(add $1 $2)
			echo $result ;;
		"b"|"Subtract"|"subtract")
			result=$(subtract $1 $2)
			echo "Difference: $result" ;;
		#### Must add function calls #####
		"c"|"Multiply")
			echo "Multi";;
		"d"|"Divide")
			echo "Divide";;
		"e"|"Power-of")
			echo "power";;
		"f"|"Modulus")
			echo "Modulus";;
		"g"|"Exit")
			echo "Exit Selected"
			exit 1;;
		#### Remove when finished #####
		*)
			echo "Not a Valid Option";;
	esac
}



#make an array for the options
options=("Add" "Subtract" "Multiply" "Divide" "Power-of" "Modulus" "Exit")

#while true; do

# call the main function to start the Calculator.
main_function $1 $2 $options
	
#sleep 2
#done

#add $1 $2
