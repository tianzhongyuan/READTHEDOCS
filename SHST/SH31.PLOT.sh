Rscript FUN3101_PLOT_STAT.R        
wait
#Rscript FUN3102_PLOT_GBANNO.R      
#wait
Rscript FUN3103_PLOT_STAT_AGGR.R   
wait
#Rscript FUN3104_PLOT_GBANNO_AGGR.R
for F in *.png
do
open $F
done
