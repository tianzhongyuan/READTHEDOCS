"""
 STA.CMB.csv
rHG037B.0,3438,4543,687,7262,22155,1109,7197,1339,4706,70,71,104,601,18603,112368
rHG037B.75,1280,1365,238,2165,7263,375,2438,499,1279,25,18,29,139,4900,27794
rHG037B.80,1064,1149,196,1813,6099,320,2059,436,1050,23,14,25,114,4004,22705
"""
IN01="STA.CMB.csv"
FIN01=open(IN01,"r")
D01={}
while True:
 line=FIN01.readline()
 if not line:
  break
 word=line.rstrip("\n").split(",")
 LIB=word[0]
 SUM=0
 for i in word[1:len(LIB)+1]:
  


print(list(D01.keys())[0],list(D01.values())[0],len(D01),"D01")
print(list(D01.keys())[len(D01)-1],list(D01.values())[len(D01)-1],len(D01),"D01")

