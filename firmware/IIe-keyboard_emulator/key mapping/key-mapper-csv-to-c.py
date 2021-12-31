# for x in range(106):
# 	print(hex(x)+", ")

# get normal
def get_field(col):
	f = open("mapping-rev1.csv")
	counter = 0
	for x in f:
		if (counter > 0):
			x = x.strip()
			fields = x.split(",")
			print(fields[col] + ",", end='')
			if (counter % 8 == 0):
				print("")
		counter = counter + 1
	f.close()

print("uint8_t normal_kbd_map[] = {")
get_field(2)

print("};\n\nuint8_t ctrl_kbd_map[] = {")
get_field(3)

print("};\n\nuint8_t shift_kbd_map[] = {")
get_field(4)

print("};\n\nuint8_t both_kbd_map[] = {")
get_field(5)
print("};\n\n//", end='')