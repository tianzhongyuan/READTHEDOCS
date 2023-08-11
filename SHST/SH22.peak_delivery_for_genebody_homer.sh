for R in *rgn
do
   D="GBANNO."${R}"..homer.GBANNO"
   rm -rf $D
   mkdir $D
   cd $D
      pwd
      ln -s ../$R RGN
      cat RGN|awk -v OFS="\t" '{print $1,$2,$3,$10"|SMT",$6,"+/-"}' >  HOMER_RGN
      wait
      nohup sh ../FUN2201_homer_annotatePeaks.sh 2>&1 > HOMER_RGN.GBANNO.log     
      wait
      cat HOMER_RGN.GBANNO|awk -v NAME=$D -v OFS="\t" '{if(NR != 1) print $0,NAME}' > HOMER_RGN.GBANNOID
      wait
   cd ../


done
cat GBANNO.*.GBANNO/HOMER_RGN.GBANNOID > RSLT22.HOMER_RGN.GBANNOIDCMB
chmod 755 RSLT22.HOMER_RGN.GBANNOIDCMB

