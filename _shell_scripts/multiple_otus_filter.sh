for k in $1/*fa;

do 

a=$(grep -c "dmag" $k)
b=$(grep -c "dpul" $k)
c=$(grep -c "etex" $k)
d=$(grep -c "lapu" $k)
e=$(grep -c "lart" $k)
f=$(grep -c "lcou" $k)
g=$(grep -c "lubb" $k)
h=$(grep -c "ocin" $k)
i=$(grep -c "tcan" $k)
l=$(grep -c "tcas" $k)
m=$(grep -c "tita" $k)
n=$(grep -c "tlon" $k)
o=$(grep -c "tusa" $k)
p=$(grep -c "afra" $k)

if  [ "$a" -le 1 ] && [ "$b" -le 1 ] && [ "$c" -le 1 ] && [ "$d" -le 1 ] && [ "$e" -le 1 ] && [ "$f" -le 1 ] && [ "$g" -le 1 ] && [ "$h" -le 1 ] && [ "$i" -le 1 ] && [ "$l" -le 1 ] && [ "$m" -le 1 ] && [ "$n" -le 1 ] && [ "$o" -le 1 ] && [ "$p" -le 1 ];

then echo $k >> lst_single_copy_genes;

fi;

done
