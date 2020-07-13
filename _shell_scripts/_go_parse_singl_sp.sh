for i in $(cat $1 | awk -F "|" '{print $2}' | awk '{print $1}' | sort -u); do go=$(grep $i $1 | awk '{print $3}' | tr "\n" " "); echo -ne "$i $go \n" >> $2; done
