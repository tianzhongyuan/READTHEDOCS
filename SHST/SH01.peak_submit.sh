for F in *.sPileup 
do
  cat $F|awk -v OFS="\t" '{print $1,$5,$5+1,1,$5,$6,$7,$8,$9,$10"|"$1"|"$2"|"$3"|"$4}' > $F.smt.rgn
done

