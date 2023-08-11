for F in ../EBV23DATA/CMB*peak.*.pctoff.sPileup
do
ln -s $F
echo $F
done
#ln -s ../EBV23DATA/rHG037B.peak.85.pctoff.sPileup .
cat ../EBV23DATA/BASIC_E116_15_coreMarks_hg38lift_dense.bed.txt|grep -v "Chromosome"|awk -v OFS="\t" '{print $1,$2,$3,"HG38STAT-"NR,int($5),$6,$4}' > HG38STAT.note

