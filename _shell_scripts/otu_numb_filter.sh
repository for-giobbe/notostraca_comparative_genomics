while getopts ":i:o:c:h" o; do
    case "${o}" in


	i) input_folder=${OPTARG}
            ;;
	o) output_folder=${OPTARG}
            ;;
        c) n=${OPTARG}
            ;;
	h) echo "
                        List of non-optional arguments

                        -n	min number OTU
"
               exit
           ;;
         esac
     done

#####################################################################################################################

mkdir $output_folder

cd $input_folder

for i in *.fa*;

	do
	export a=$(grep ">" $i | wc -l);

		if [ $a -ge "$n" ];
		then echo "$i" >> "list_"$n"_otu.tmp";
		fi;

	done;

xargs -a "list_"$n"_otu.tmp" cp -t ../$output_folder

