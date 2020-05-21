#!/bin/bash
# This program designed and developed by Mohsen Jalayeri in linux bash
# This is a basic program and I will update it regularly.
# you can access this file from: https://github.com/Mohsenj14/HW05

# get number 
getnum() {
printf "================ Print Prime number from 2 to n by Sieve of Eratosthenes ================\n"
while true
	do
		printf "Please insert a number: "
		read num

		if [[ "$num" =~ ^[-+]?([1-9][[:digit:]]*|0)$ ]]
			then
			break
		else
			echo "Error, please insert a number"
		fi
done
}


erathos() {

declare -A array[2,$num] 
for((i=1; i<=num; i++))
do
  array[1,$i]=$i
  array[2,$i]=1
done

array[2,1]=0

for((i=2; i<=num; i++))
do
  if [ ${array[2,$i]} -eq 1 ]
  then
	for((j=2; $(($i * j))<=num; j++))
	do
	array[2,$(($i * j))]=0
	done
  fi
done


printf "******************************* \nPrime numbers are:\n\n"
for((i=2; i<=num; i++))
do
if [ ${array[2,$i]} -eq 1 ]
  then
 printf "%d	" ${array[1,$i]}
 fi
done
printf "\n"

}

# Start
getnum
erathos

