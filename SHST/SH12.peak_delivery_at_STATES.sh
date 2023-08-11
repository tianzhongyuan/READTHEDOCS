

for R in *rgn
do
 for N in *.note
  do
   D="DLV."${R}".."${N}".DLV"
   rm -rf $D
   mkdir $D
   cd $D
      pwd
      ln -s ../$R RGN
      ln -s ../$N NOTE
      wait
      bedtools intersect -a RGN -b NOTE -wo > RGN_NOTE
      wait
      cat RGN_NOTE|awk -v NAME=$D -v OFS="\t" '{print $0,NAME}' > RGN_NOTE.RSLT

      wait
   cd ../

  done

done


