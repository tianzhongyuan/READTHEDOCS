#setwd("/Volumes/TOSHIBA/EBV2023/EBV23002_peak_hit_states")
args = commandArgs(trailingOnly=TRUE)
IN=args[1]
#IN="rHG045.RESULT.4MAT.SMP.SUMRY" #args[1]
FIN=read.table(IN)
library(dplyr)
library(ggplot2)
head(FIN)
SIN<-FIN  #%>%select(V1,V3,V5)
colnames(SIN)<-c("lib","V2","state","V4","count")
head(SIN)

#GSIN<-SIN%>%filter(lib%in%c("DLV.A-roX2_AGGPEAK.SMT.rgn..S29STAT.note.DLV","DLV.B-SK7_AGGPEAK.SMT.rgn..S29STAT.note.DLV")  )
unique(SIN$lib)
str(SIN)
COL_STAT=c(
  "1"="#FF0000",
  "2"="#FF4500",
  "3"="#32CD32",
  "4"="#008000",
  "5"="#006400",
  "6"="#C2FF05",
  "7"="#FFFF00",
  "8"="#66CDAA",
  "9"="#8A91D0",
  "10"="#CD5C5C",
  "11"="#E9967A",
  "12"="#BDB76B",
  "13"="#808080",
  "14"="#C0C0C0",
  "15"="#CFD8DC"
)
library(stringr)
unique(SIN$state)
SIN$chrom_state<-factor(SIN$state,levels=as.factor(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)))
tail(SIN)
SIN[c('library', 'percentile')] <- str_split_fixed(SIN$lib, '[.]', 2)


png(paste0(IN,".png"),600,400)
ggplot(SIN,aes(x=percentile,y=count,fill=chrom_state))+
  geom_bar(position="fill", stat = "identity")+
  scale_fill_manual(values=COL_STAT)+
  scale_y_continuous(labels = scales::percent)+
  theme_bw()+
  xlab(unique(SIN$library))+
  ylab("peak sum %")+
  theme(
    panel.grid = element_blank(),
  )+
  ggtitle(IN)


dev.off()

#ggsave(paste0("R03153301.",IN,".png"),PLOT)


