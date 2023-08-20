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

check_second_num_valid () {
	# check number validity 
	if  [[ ! "$#" =~ $re ]]; then
		echo "Error, Must enter 1 positional argument" >&2
		exit 1
	elif  [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number" >&2
		exit 1
	elif  (( $1 == 0 )); then
		echo "Error, the 2nd number is $1, Cannot Divide by Zero!" >&2
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


multiply() {
	# check input validation - 2 positional arguments
	if [[ "$#" -ne "2" ]]; then
		echo "Error: You Didn't Enter 2 Arguments" >&2
		exit 1
	# check that first number is valid
	elif [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number" >&2
		exit 1
		# check that second number is valid
	elif ! [[ "$2" =~ $re ]]; then
		echo "Error, $2 is not a valid number" >&2
		exit 1
	# all good, make the multiplication calculation.
	else
		let result=$1*$2
		# echo back $result from the function
		echo $result
		fi
}

divide() {
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
    # check for division by zero
	elif [[ "$2" -eq "0" ]]; then
		echo "Error, cannot divide by zero" >&2
		exit 1
    # all good, make the division calculation.  
		else 
		let result=$1/$2 
		# echo back $result from the function 
		echo $result 
	fi 
}

modulus () {
	# check input validation - 2 positional arguments
	if [[ "$#" -ne "2" ]]; then
		echo "Error: You Didn't Enter 2 Arguments" >&2 
        	exit 1
        # check that first number is valid
	elif  [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number." >&2
		exit 1
	# check that second number is valid
	elif ! [[ "$2" =~ $re ]]; then
		echo "Error, $2 is not a valid number." >&2
		exit 1
	#all good, make the addition calculation. 
	else
		let result=$1%$2
		# echo back $result from the function
		echo $result
	fi
}


power_of () {
	# check input validation - 1 positional arguments
	if [[ "$#" -ne "2" ]]; then
		echo "Error: You Didn't Enter 2 Arguments." >&2 
        	exit 1
        # check that number is valid
	elif  [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number." >&2
		exit 1
	# check that second number is valid
	elif ! [[ "$2" =~ $re ]]; then
		echo "Error, $2 is not a valid number." >&2
		exit 1
	#all good, make the addition calculation. 
	else
		let result=$1**$2
		# echo back $result from the function
		echo $result
	fi
}


is_prime () {
	# check function input validation
	if [[ "$#" -ne "1" ]]; then
		echo "Error: Must Provide 1 Argument." >&2 
        	return
        # check if parameter is a valid number
        elif  [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number." >&2
		return
	fi
	
	num=$1
	# check if the number is 1 or less then no need to loop and it not a prime
	if (( num <= 1 )); then
		echo "$num is not prime."
		return
	# check if it's 2 then it's the first prime number
	elif (( num == 2 )); then
		echo "$num is prime."
		return
	elif (( num % 2 == 0 )); then
		echo "$num is not prime."
		return
	else
		for (( i=3; i*i<=num; i+=2 )); do
			if (( num % i == 0 )); then
				echo "$num is not prime."
				return
			fi
		done
	fi
	echo "$num is prime."
}

is_odd_even () {
# check input validation - 2 positional arguments
	if [[ "$#" -ne "1" ]]; then
		echo "Error: You Didn't Enter 2 Arguments." >&2 
        	exit 1
        # check that first number is valid
	elif  [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number." >&2
		exit 1
	#all good
	else
		let local result_even=$1%2
		# echo back $result from the function
		if (( $result_even == 0 ));then
			echo "$1 is an even number."
		elif (( $result_even == 1 )); then
			echo "$1 is an odd number."
		fi
	fi
}

is_divided_by_five () {
# check input validation - 1 positional arguments
	if [[ "$#" -ne "1" ]]; then
		echo "Error: You Didn't Enter 2 Arguments" >&2 
        	exit 1
        # check that the number is valid
	elif  [[ ! "$1" =~ $re ]]; then
		echo "Error, $1 is not a valid number" >&2
		exit 1
	#all good 
	else
		let local result=$1%5
		if (( $result == 0 )); then  
			echo "$1 is divided by five."
		else
			echo "$1 is not divided by five."
		fi
		# echo back $result from the function
	fi
}

echo_menu () {
	echo "|-------------------|"
	echo "| Select operation  |"
	echo "|-------------------|"
	echo "|a. ${options[0]}             |"
	echo "|-------------------|"
	echo "|b. ${options[1]}        |"
	echo "|-------------------|"
	echo "|c. ${options[2]}        |"
	echo "|-------------------|"
	echo "|d. ${options[3]}          |"
	echo "|-------------------|"
	echo "|e. ${options[4]}        |"
	echo "|-------------------|"
	echo "|f. ${options[5]}         |"
	echo "|-------------------|"
	echo "|g. ${options[6]}            |"
	echo "|___________________|"
	echo
}




# Main start

#make an array for the options
options=("Add" "Subtract" "Multiply" "Divide" "Power-of" "Modulus" "Exit")

result=-9999
while :; do


	echo_menu

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

		"c"|"Multiply"|"multiply") 
		    read -p "Enter first number: " num1 
		    check_num_valid $num1 
		    read -p "Enter second number: " num2 
		    check_num_valid $num2 
		    result=$(multiply $num1 $num2) 
		    echo "Result: $result" ;;

		"d"|"Divide"|"divide") 
		    read -p "Enter first number: " num1 
		    check_num_valid $num1 
		    read -p "Enter second number: " num2 
		    check_second_num_valid $num2 
		    result=$(divide $num1 $num2) 
		    echo "Result: $result" ;;


		"e"|"Power-of")
		    read -p "Enter base number: " num1
		    check_num_valid $num1
		    read -p "Enter exponent: " num2
		    check_num_valid $num2
		    result=$(power_of $num1 $num2)
		    echo "Result: $result"
		    ;;

		"f"|"Modulus")
		    read -p "Enter first number: " num1
		    check_num_valid $num1
		    read -p "Enter second number: " num2
		    check_second_num_valid $num2
		    result=$(modulus $num1 $num2)
		    echo "Result: $result"
		    ;;



		"g"|"Exit")

		       echo "----************----"
		echo "----************----"
		echo "----****BYE!****----"
		echo "----************----"
		echo "----************----"
			exit 1;;

		*)
			echo "Not a Valid Option";;
	esac
	if (( $result != -9999 )); then
		is_prime $result
		is_odd_even $result
		is_divided_by_five $result
	fi	
	echo

	sleep 2

done

#add $1 $2
