

#DLV.rHG037B.peak.85.pctoff.sPileup.smt.rgn..HG38STAT.note.DLV
#rHG037B.peak.85.pctoff.sPileup
for F in *.sPileup
do
LIB=$(echo $F|cut -d"." -f1)
rm -rf $LIB.RESULT

 for RESULT in DLV.${LIB}.*.DLV/RGN_NOTE.RSLT
  do
    cat $RESULT >> $LIB.RESULT    
  done

done


