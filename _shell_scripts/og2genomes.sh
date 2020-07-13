# single argument for species to reformat

	for i in *ol; 

	do 

		for j in $(grep $1 $i); 

		do 

			header_init=$(grep $j $i); 
			header_new=$(echo "$header_init|$i" | sed 's/\.fa\.ol//'); 
			seq=$(grep -A 1 $j $i | tail -1); 
			echo -e "$header_new\n$seq" >> $1.og2genome.out; 

		done; 
		
	done;
