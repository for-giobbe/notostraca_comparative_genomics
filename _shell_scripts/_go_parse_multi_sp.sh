for og in $(cat _all_OGs.lst);

	do 

	tusa_og=$(grep $og tusa.go.out | awk '{for (i=2; i<=NF; i++) print $i}') 						# removes the og identifier
	tcan_og=$(grep $og tcan.go.out | awk '{for (i=2; i<=NF; i++) print $i}')
	tita_og=$(grep $og tita.go.out | awk '{for (i=2; i<=NF; i++) print $i}')
	tlon_og=$(grep $og tlon.go.out | awk '{for (i=2; i<=NF; i++) print $i}')

	lart_og=$(grep $og lart.go.out | awk '{for (i=2; i<=NF; i++) print $i}')
	lcou_og=$(grep $og lcou.go.out | awk '{for (i=2; i<=NF; i++) print $i}')
	lubb_og=$(grep $og lubb.go.out | awk '{for (i=2; i<=NF; i++) print $i}')
	lapu_og=$(grep $og lapu.go.out | awk '{for (i=2; i<=NF; i++) print $i}')

	dmag_og=$(grep $og dmag.go.out | awk '{for (i=2; i<=NF; i++) print $i}')
	dpul_og=$(grep $og dpul.go.out | awk '{for (i=2; i<=NF; i++) print $i}')

        etex_og=$(grep $og etex.go.out | awk '{for (i=2; i<=NF; i++) print $i}')
        afra_og=$(grep $og afra.go.out | awk '{for (i=2; i<=NF; i++) print $i}')

        tcas_og=$(grep $og tcas.go.out | awk '{for (i=2; i<=NF; i++) print $i}')
        ocin_og=$(grep $og ocin.go.out | awk '{for (i=2; i<=NF; i++) print $i}')


	echo -n $og $tusa_og $tcan_og $tita_og $tlon_og $lart_og $lcou_og $lubb_og $lapu_og $dmag_og $dpul_og $etex_og $afra_og $tcas_og $ocin_og | awk '{for (i=1;i<=NF;i++) if (!a[$i]++) printf("%s%s",$i,FS)}{printf("\n")}'	# collapse redundant goterms for each og

done
