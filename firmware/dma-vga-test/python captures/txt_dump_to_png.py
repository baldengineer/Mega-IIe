# from: https://stackoverflow.com/questions/19651055/saving-image-with-pil

from PIL import Image

# RGB4 RGB8 RGB1 RGB2
# RGB8 RGB RGB2 RGB1

newImg1 = Image.new('RGB', (560,192))

filename = "txt_dumps/14_reversed_SR_number_numbers_title.txt"



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

# reverses every 8 characters of the string [01234567] becomes [76543210]
# wuzzled_string = ""
# chunksplit = 8
# chunks = [super_long_string[i:i+chunksplit]
# for i in range (0, len(super_long_string), chunksplit)]
# for chunk in chunks:
#     for c in reversed(chunk):
#         wuzzled_string = wuzzled_string + c
wuzzled_string = super_long_string
pixels = len(wuzzled_string)
print(f"{pixels} pixels")


color = 0
character = 0
offset = 0
for i in range (0,192):
    for j in range (0,560):
        try:
            c = wuzzled_string[character+offset]
            character = character + 1
            # 10 has: ['f', '9', '5', 'd', 'a', '0']
            # 11 has: ['1', 'f', '9', '0', '5', 'a']
            if (c == 'd') : color = (255, 255, 0)    

            
            if (c == '1') : color = (230, 230,250)
            if (c == '5') : color = (230, 230,250)
            if (c == '9') : color = (0,  255, 255) # outside border
            if (c == 'a') : color = (0, 255, 0)    # inside green field
            if ((c == '#') or (c == 'f')) : color = (255, 255, 255)
            if ((c == '.') or (c == '0')) : color = (0, 0, 0)

            # if ((c == '.') or (c == '0')): color = (0, 0, 0)
            # if (c == '1') : color = (255,  16,  16)
            # if (c == '5') : color = (64,  64,  64)
            # if (c == '9') : color = (96,  96,  96)
            # if (c == 'd') : color = (192, 192, 192)
            # if (c == 'a') : color = (127, 127, 127)
            # if ((c == '#') or (c == 'f')) : color = (255, 255, 255)
        except:
            color = 127
            print (f"I don't know what {c} is ...")

        newImg1.putpixel((j,i),(color)) # color should be more like:  (0, 0, 0, 255)

newImg1.save("pngs/14_reversed_SR_number_numbers_title.png")

