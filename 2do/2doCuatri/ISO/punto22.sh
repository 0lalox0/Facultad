#!/bin/bash
num=(10 3 5 7 9 3 5 4)
function productoria(){
mul=1
for i in ${num[@]}; do	
((mul *= i))

done
echo $mul
}
productoria
exit 0
