while getopts ":a:n:o:h" o; do
    case "${o}" in

        a) aa_folder=${OPTARG}
            ;;
        n) nt_folder=${OPTARG}
            ;;
	o) output_folder=${OPTARG}
            ;;
	h) echo "
                        List of non-optional arguments

                        -a path to the aminoacid folder
                        -n path to the nucleotide folder                                                       
                        -o path to the output folder

			The aminoacid alignement header must be formatted like >contigname_speciesname
			The nucleotide file must be renamed like speciesname_CDS.ref.fa
			The amminoacid ogs must be named OG0000000.aa.fa
"
               exit
           ;;
         esac
     done

#################################################################################################################################################

	mkdir $output_folder

	cd $aa_folder

	for j in *fa;

	do

	name=$(echo $j | awk -F "." '{print $1}')

	for i in $(grep ">" $j | tr -d ">"); 

		do 

		sp=$(echo $i | awk -F "_" '{print $NF}');
		contig=$(echo $i | sed "s/_$sp//");
		sequence=$( grep -A 1 $contig ../$nt_folder/"$sp"_CDS.ref.fa);

		echo "$sequence" >> ../$output_folder/$name".nt.fa" ;

		done;

	done;
