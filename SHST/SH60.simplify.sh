for F in *.4MAT
do
cat $F|cut -f3,4|awk -F"[\t.]" -v OFS="\t" '{print $3"."$5,$1}'  > $F.SMP
done
#cat rHG037B.RESULT.4MAT|cut -f3,4|awk -F"[\t.]" -v OFS="\t" '{print $3"."$5,$1}'  > rHG037B.RESULT.4MAT.SMP
