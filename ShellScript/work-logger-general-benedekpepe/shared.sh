if [ -z "$1" ]
then
awk -F"," '{echo;x+=$3}END{print " " x}' ./logs/$name/january.csv
else
awk -F"," '{echo;x+=$3}END{print " " x}' ./logs/$name/$1.csv
fi
