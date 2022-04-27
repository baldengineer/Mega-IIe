# from: https://stackoverflow.com/questions/19651055/saving-image-with-pil
# created by James Lewis @baldengineer
# converts a dump from VGA2040 to a PNG for the Mega IIe project

from tkinter import *  
from PIL import Image, ImageTk
import sys
import os

import serial
from datetime import datetime

LINE_WIDTH = 584
SER_PORT = "COM5"
SER_SPEED = "115200"
SER_TIMEOUT = 5

basename = ""
if (len(sys.argv) == 1):
    mode = "serial"
    wuzzle = False
else:
    if (len(sys.argv) >= 2):
        arg = sys.argv[1]
        if (arg.lower() == "serial"):
            mode = "serial"
            now = datetime.now()
            basename = now.strftime("%Y-%m-%d_%H-%M_%S")
            print("date and time =", basename)  
        else:
            mode = "file"
            basename = sys.argv[1]
            wuzzle = False
    if (len(sys.argv) == 3):
        arg = sys.argv[2]
        if ((arg.lower() == "true") or (arg == "1") or (arg.lower() == "yes")):
            wuzzle = True

if (basename.endswith('.txt')): basename = basename.replace(".txt","")
txt_filename = f"txt_dumps/{basename}.txt"
png_filename  = f"pngs/{basename}.png"

if (mode == "serial"):
    print(f"Go-Go Gadget Serial port...{SER_PORT} at {SER_SPEED}")
    with serial.Serial(SER_PORT, int(SER_SPEED), timeout=SER_TIMEOUT) as ser:
        with open(txt_filename, 'w') as f:
            ser.write(b'!')
            line = ser.readlines()
            for value in line:
                txt = value.decode().strip()
                if (('START' in txt) or ('END' in txt)):
                    continue
                #print(txt)
                f.write(str(txt) + '\n')
    print("... Serial done")


newImg1 = Image.new('RGB', (LINE_WIDTH,384))

# get rid of line breaks and white space
super_long_string = ""
current_line = ""
character_count = 0
print ("Cleaning text file...")
with open(txt_filename) as f:
    while True:
        c = f.read(1)
        if not c:
            break
        if ((c == '\n') or (c ==' ')):
            continue
        current_line = current_line + c
        character_count = character_count + 1
        if (character_count == LINE_WIDTH):
            super_long_string = super_long_string + current_line + current_line
            current_line = ""
            character_count = 0

print(f"{len(super_long_string)} characters")

############################################################
# reverses every 8 characters of the string [01234567] becomes [76543210]
# only used for early vga2040 captures. (was shifting in wrong)
# RGB4 RGB8 RGB1 RGB2
# RGB8 RGB RGB2 RGB1
if (wuzzle):
    print("Wuzzling...")
    wuzzled_string = ""
    chunksplit = 8
    chunks = [super_long_string[i:i+chunksplit]
    for i in range (0, len(super_long_string), chunksplit)]
    for chunk in chunks:
        for c in reversed(chunk):
            wuzzled_string = wuzzled_string + c
else:
    wuzzled_string = super_long_string

pixels = len(wuzzled_string)
print(f"{pixels} pixels")
############################################################

if (len(wuzzled_string) != len(super_long_string)):
    print("Errr... they didn't make. Bailing...")
    exit()

print ("Generating image...")
color = 0
character = 0
offset = 0
for i in range (0,384):
    for j in range (0,LINE_WIDTH):
        try:
            c = wuzzled_string[character+offset]
            character = character + 1
            # 10 has: ['f', '9', '5', 'd', 'a', '0']
            # 11 has: ['1', 'f', '9', '0', '5', 'a']
            if (c == 'd') : color = (255, 255, 0)    
       
            if (c == '1') : color = (230, 230,250)
            if (c == '5') : color = (230, 230,250)
            if (c == '9') : color = (0,  255, 255) # outside border (number munchers)
            if (c == 'a') : color = (0, 255, 0)    # inside green field (number munchers)
            if ((c == '#') or (c == 'f')) : color = (255, 255, 255)
            if ((c == '.') or (c == '0')) : color = (0, 0, 0)

        except Exception as e:
            color = 127
            print (f"I don't know what {c} is ... at #{character}")
            print(str(e))
            #exit()

        newImg1.putpixel((j,i),(color)) # color should be more like:  (0, 0, 0, 255)

print("Saving image...")
newImg1.save(png_filename)
#print("Asking windows to please open the file.")
#os.startfile(os.path.realpath(png_filename))
print("Asking tkinter to make pretty pictures")
root = Tk()
canvas = Canvas(root, width=LINE_WIDTH, height=384)
canvas.pack()
img = ImageTk.PhotoImage(Image.open(png_filename))
canvas.create_image(0, 0, anchor=NW, image=img)
root.mainloop()
print("Printing message to say exiting.")
print("Exiting.")
exit()
