
for F in *.RESULT
do

cat $F|awk -v OFS="|" '{print $10,$5,$7"\t"$14,$11,$12,$13"\t"$15"\t"$19}' > $F.4MAT

done

