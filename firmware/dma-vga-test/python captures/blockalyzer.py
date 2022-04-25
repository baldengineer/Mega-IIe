
filename = "bin/01-first-try-sitting-at-prompt-maybe.txt"
#filename = "bin/02-apple-ii-at-top.txt"

x = 0
wf = open("01-dotted.txt", 'w')
with open(filename) as f:
	while True:
		c = f.read(1)
		if (c == '\n'):
			continue
		x = x + 1 
		if not c:
			print("End of file")
			wf.close()
			break
		if (x==560):
			x=0
			if (c == '0'):
				c = '.'
			if (c == 'f'):
				c = '#'
			print(c)
			wf.write(c)
			wf.write('\n')
		else:
			if (c == '0'):
				c = '.'			
			if (c == 'f'):
				c = '#'
			print(c, end='')
			wf.write(c)
