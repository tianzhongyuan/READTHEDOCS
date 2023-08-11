#setwd("/Volumes/TOSHIBA/EBV2023/EBV23002_peak_hit_states")
args = commandArgs(trailingOnly=TRUE)
IN01=args[1]
#IN="rHG045.RESULT.4MAT.SMP.SUMRY" #args[1]
FIN01=read.table(IN01)

IN02="HG38STAT.note.SUMRY"
FIN02=read.table(IN02)
FIN<-rbind(FIN01,FIN02)

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
  "2"="orange",  #"#FF4500",
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
library("reshape2")

KIN<-SIN%>%select(lib,state,count)
head(KIN)
colnames(KIN)<-c("lib","state","value")
DIN<-acast(KIN,lib ~ state)
DIN



png(paste0(IN01,".png"),600,400)
ggplot(SIN,aes(x=percentile,y=count,fill=chrom_state))+
  geom_bar(position="fill", stat = "identity")+
  scale_fill_manual(values=COL_STAT)+
  scale_y_continuous(labels = scales::percent)+

#  scale_x_discrete(sec.axis = sec_axis(~.*count,name="peak sums"))+
  theme_bw()+
  xlab(unique(SIN$library))+
  ylab("peak sum %")+
  theme(
    strip.background=element_blank(),
    panel.grid = element_blank(), 
    )+
  facet_grid(.~library, scales = "free", space='free') +
  ggtitle(IN01)


dev.off()
write.table(DIN,paste0(IN01,".csv"),col.names=TRUE,quote=FALSE,row.names=TRUE,sep=",")
#ggsave(paste0("R03153301.",IN,".png"),PLOT)

names(airquality) <- tolower(names(airquality))
aqm <- melt(airquality, id=c("month", "day"), na.rm=TRUE)
head(aqm)
acast(aqm, month ~ variable, mean)

