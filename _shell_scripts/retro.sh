for i in aligned_aa/*aln; do name=$(echo $i | awk -F "." '{print $1}' | sed 's/aligned_aa//g'); pal2nal.pl $i final_nt_og/$name".nt.fa" -output fasta> aligned_nt/$name".mafft.nt.aln"; done
