for F in *.SUMRY
do
echo $F
Rscript SH62_PLOT.R $F
done
