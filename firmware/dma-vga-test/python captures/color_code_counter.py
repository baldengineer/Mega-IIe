filename = "txt_dumps/11-number munchers 2.txt"


# get rid of line breaks and white space
super_long_string = ""
with open(filename) as f:
    while True:
        c = f.read(1)
        if not c:
            break
        if ((c == '\n') or (c ==' ')):
            continue

        super_long_string = super_long_string + c
print(f"{len(super_long_string)} characters")

unique_char = list(set(super_long_string))
print(unique_char)