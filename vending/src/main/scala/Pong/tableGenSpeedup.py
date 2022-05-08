from random import randrange, seed
seed(100)
for i in range(16):
  scale = int(1.2**(i-1))
  
  pd1 = "  "
  if(i > 9):
    pd1 = " "
  if(i > 99):
    pd1 = ""
  pd2 = " "
  if(scale > 9):
    pd2 = ""
  print(f"is({i}.U) {pd1}" + "{" + f" io.out := {scale}.U {pd2}" + "}")
