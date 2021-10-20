# for x in range(106):
# 	print(hex(x)+", ")

# get normal
def get_field(col):
	f = open("mapping-rev1.csv")
	counter = 0
	for x in f:
		x = x.strip()
		fields = x.split(",")
		print(fields[col] + ",", end='')
		if (counter % 8 == 0):
			print("")
		counter = counter + 1
	f.close()

get_field(2)
print("-"*10)
get_field(3)
print("--------------")
get_field(4)
print("--------------")
get_field(5)