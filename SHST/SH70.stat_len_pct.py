"""
HG38STAT.note|head
chr1	10000	10600	HG38STAT-1	9	138,145,208	9_Het
chr1	10600	96080	HG38STAT-2	15	207,220,216	15_Quies
"""
IN01="HG38STAT.note"
FIN01=open(IN01,"r")
FOUT=open(IN01+".SUMRY","w")
D01={}
while True:
 line=FIN01.readline()
 if not line:
  break
 word=line.rstrip("\n").split("\t")
 C=word[0]
 S=int(word[1])
 E=int(word[2])
 STAT=word[4]
 LEN=E-S

 if STAT not in D01:
  D01[STAT]=LEN
 else:
  D01[STAT]=LEN+D01[STAT]
print(list(D01.keys())[0],list(D01.values())[0],len(D01),"D01")
print(list(D01.keys())[len(D01)-1],list(D01.values())[len(D01)-1],len(D01),"D01")
print(D01)
for K in D01:
 newline="\t".join(["CHST15.len","ITEM",str(K),"TOTAL_LEN",str(D01[K])])
 FOUT.write(newline+"\n")


"""
rHG042.95	ITEM	11	COUNT	14
rHG042.95	ITEM	12	COUNT	8
rHG042.95	ITEM	13	COUNT	12
rHG042.95	ITEM	14	COUNT	396
rHG042.95	ITEM	15	COUNT	2314
rHG042.95	ITEM	2	COUNT	452
"""
