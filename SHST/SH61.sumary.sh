for F in *SMP
do 
cat $F|sort|uniq -c|awk -v OFS="\t" '{print $2,"ITEM",$3,"COUNT",$1}'|sort -k1,1 -k2,2n > $F.SUMRY
done
