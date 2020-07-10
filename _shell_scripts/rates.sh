for i in *_phy; do sed "s/seq2be/$i/" test.ctl | sed "s/outfile/$i"_out"/" > tmp.ctl; ../RRTree tmp.ctl; rm tmp.ctl; done

echo -e "cluster\tKa_lineage1\tKa_lineage2\tdKa\tP" > out.total.tab; for j in *_out; do a=$(grep "mean Ka notostraca" $j | awk -F ":" '{ print $NF}' | tr -d " "); b=$(grep "mean Ka ony" $j | awk -F ":" '{ print $NF}' | tr -d " ");c=$(grep "dKa" $j | awk -F ":" '{ print $2}' |  awk '{print $1}'| tr -d " ");d=$(grep "exact prob" $j | awk -F ":" '{ print $2}' | tr -d " "); echo -e "$j\t$a\t$b\t$c\t$d" >> out.total.tab; done
