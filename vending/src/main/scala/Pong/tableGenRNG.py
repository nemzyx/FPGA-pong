from random import randrange, seed
seed(100)
for i in range(256):
  rnd = randrange(16)
  pd1 = "  "
  if(i > 9):
    pd1 = " "
  if(i > 99):
    pd1 = ""
  pd2 = " "
  if(rnd > 9):
    pd2 = ""
  print(f"is({i}.U) {pd1}" + "{" + f" io.random := {rnd}.U {pd2}" + "}")
