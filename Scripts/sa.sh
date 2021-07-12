#!/bin/bash
read -p "enter kind type:" value
line=`wc deploy.yaml | awk '{print $1}'`
num=`cat deploy.yaml | nl | grep -i "kind: $value" | awk '{print $1}'`
file=`cat deploy.yaml`
for x in $file
do
if ( $x == "kind: *eployment" )
then
echo $x
continue
fi
done 


read -p "enter kind type:" value
#a=`cat deploy.yaml | nl | grep -i kind | nl | grep -i $value | awk 'NR==1{print $2}'`
a=` grep -n "^k" deploy.yaml | nl | grep -i $value | awk '{print ($2+0)}'`
#308
b=`cat deploy.yaml | nl | grep -i kind | nl | grep -i $value | awk '{print $1}'`
#14
c=`echo $((b+1))`
#15
d=`cat deploy.yaml | nl | grep -i kind | nl | grep -i $c | awk '{print $2}'`
z=`grep "^k" deploy.yaml | nl | grep -i $c`
y=`grep "^k" deploy.yaml | nl | grep -i "$z" | awk '{print $3}'`
x=`nl deploy.yaml | grep $y | awk '{print $1}'`
#d=`cat deploy.yaml | nl | grep -i kind | nl | awk 'NR==2 {print $0}' | grep -i $c | awk '{print $2}'`
#417
e=$((x-a))
head -$d deploy.yaml | tail -$e