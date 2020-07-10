	echo -ne "og tita tlon tcan tusa dmag dpul afra ocin tcas lart lubb lapu lcou etex \n" > $2

	for i in $1/*; 

	do 

	name=$(echo $i | awk -F "." '{print $1}' | awk -F "/" '{print $NF}')

        tita=$(grep -c tita $i);
        tlon=$(grep -c tlon $i);
        tcan=$(grep -c tcan $i);
        tusa=$(grep -c tusa $i);
        dmag=$(grep -c dmag $i);
        dpul=$(grep -c dpul $i);
        afra=$(grep -c afra $i);
        ocin=$(grep -c ocin $i);
        tcas=$(grep -c tcas $i);
        lart=$(grep -c lart $i);
        lubb=$(grep -c lubb $i);
        lapu=$(grep -c lapu $i);
        lcou=$(grep -c lcou $i);
        etex=$(grep -c etex $i);

	echo -ne "$name $tita $tlon $tcan $tusa $dmag $dpul $afra $ocin $tcas $lart $lubb $lapu $lcou $etex \n" >> $2

	done
