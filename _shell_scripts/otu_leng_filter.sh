while getopts ":i:c:h" o; do
    case "${o}" in

        i) input_folder=${OPTARG}
            ;;
	c) length_cutoff=${OPTARG}
            ;;
	h) echo "
                        List of non-optional arguments

                        -i path to the input folder (write ./ to launch the script in the current folder )
                        -c length cutoff value

			BE CAREFUL !!! 

			(1)	THIS SCRIPT WILL DELETE SEQUENCE SHORTER THAN THE LENGTH CUTOFF FROM YOUR FASTA ALIGNMENTS
			(2)	IN THE LAST STEP THIS SCRIPT WILL ELIMINATE ALL THE EMPTY FASTA ALIGNMENTS
			(3)	FILES NEED TO BE NAMED .fa .fas .fasta
			(4)	FILES CAN BE EITHER ALIGNED OR UNALIGNED, NT OR AA
"
               exit
           ;;
         esac
     done

########################################################################################################################################

	cd $input_folder
	
	for i in *.fa*;

		do 

			name=$(echo $i | awk -F "." '{$NF=""; print $0}' | tr -d " ")

			awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);} END {printf("\n");}' < $i > $name".ol.temp"			

			for j in $(grep ">" $name".ol.temp" | sed 's/>//g');

			do 

				a=$(grep -A 1 $j $name".ol.temp" | tail -1 | sed 's/-//g' | wc -c);
				l1=$(grep $j $name".ol.temp");
				l2=$(grep -A 1 $j $name".ol.temp" | tail -1);

				echo $name $j $a #>> length_stats;

					if [ $a -lt $length_cutoff ];
 					then 
					sed -i '/'$l1'/d' $name.ol.temp >/dev/null 2>&1; 
					sed -i '/'$l2'/d' $name.ol.temp >/dev/null 2>&1;
					fi; 

			done;

                        mv $name".ol.temp" $i

		done;

# removes empty files

rm -rf sed* *.tmp

for i in $( ll | awk -F " " '{print $5"_"$9}' | grep -E '^1_|^0_' | grep -E '.fa*$'); do a=$(echo $i | awk -F "_" '{print $2}'); rm $a; done

cd ..
