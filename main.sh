#! /bin/bash

# regular expression for a valid integer -? (might be negative) ^ (must start with) [0-9]+ (1 or more digits) and $ (must end with)
re='^-?[0-9]+$'

# help function to check the validaty of a number
check_num_valid () {
# check number validity 
	if  [[ ! "$#" =~ $re ]]; then
		echo "Error, Must enter 1 positional argument" >&2
		exit 1
	elif  [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number" >&2
		exit 1
	fi
	#all good. 
}

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



#make an array for the options
options=("Add" "Subtract" "Multiply" "Divide" "Power-of" "Modulus" "Exit")

echo "a. ${options[0]}"
echo "b. ${options[1]}"
echo "c. ${options[2]}"
echo "d. ${options[3]}"
echo "e. ${options[4]}"
echo "f. ${options[5]}"
echo "g. ${options[6]}"
# read input from user
read var
# check user input choice validation
case $var in
	"a"|"Add"|"add")
		read -p "Enter first number: " num1
		check_num_valid $num1
		read -p "Enter second number: " num2
		check_num_valid $num2
		result=$(add $num1 $num2)
		echo $result ;;
	"b"|"Subtract"|"subtract")
		read -p "Enter first number: " num1
		check_num_valid $num1
		read -p "Enter second number: " num2
		check_num_valid $num2
		result=$(subtract $num1 $num2)
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




#sleep 2
#done

#add $1 $2
