#!/bin/bash

lalopi=(1 2 3 4 5 6 7)

for i in ${lalopi[@]}; do
	echo $i
done


echo ${lalopi[0]}
echo ${lalopi[*]}
