# from: https://stackoverflow.com/questions/19651055/saving-image-with-pil
# created by James Lewis @baldengineer
# converts a dump from VGA2040 to a PNG for the Mega IIe project

import sys
import os
from os.path import isfile, join, exists
import serial
from datetime import datetime

from PIL import Image, ImageTk

from PySide6.QtUiTools import QUiLoader
from PySide6.QtWidgets import QApplication
from PySide6.QtGui import QPixmap
from PySide6.QtCore import QFile, QIODevice, Slot, Signal, Qt

# defauts
default_LINE_WIDTH = 584
default_FRAME_HEIGHT = 384
default_SER_PORT = "COM5"
default_SER_SPEED = "115200"
default_SER_TIMEOUT = 5
txt_dir = "txt_dumps"
png_dir = "pngs/"

def serial_capture(ser_port, ser_speed, ser_timeout, txt_filename):
    serial_success = True
    try:
        print(f"Go-Go Gadget Serial port...{ser_port} at {ser_speed}")
        with serial.Serial(ser_port, int(ser_speed), timeout=ser_timeout) as ser:
            with open(txt_filename, 'w') as f:
                ser.write(b'!')
                line = ser.readlines()
                for value in line:
                    txt = value.decode().strip()
                    if (('START' in txt) or ('END' in txt)):
                        continue
                    f.write(str(txt) + '\n')
    except Exception as e:
        print(str(e))
        serial_success = False
    print("... Serial done")
    return serial_success

def read_in_txt_file(txt_filename):
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
    return super_long_string

def wuzzler(in_string):
    ############################################################
    # reverses every 8 characters of the string [01234567] becomes [76543210]
    # only used for early vga2040 captures. (was shifting in wrong)
    # RGB4 RGB8 RGB1 RGB2
    # RGB8 RGB RGB2 RGB1
    print("Wuzzling...")
    wuzzled_string = ""
    chunksplit = 8
    chunks = [in_string[i:i+chunksplit]
    for i in range (0, len(in_string), chunksplit)]
    for chunk in chunks:
        for c in reversed(chunk):
            wuzzled_string = wuzzled_string + c

    pixels = len(wuzzled_string)
    print(f"{pixels} wuzzled pixels")
    return wuzzled_string
    ############################################################

def generate_png(in_string, png_filename):
    newImg1 = Image.new('RGB', (LINE_WIDTH,FRAME_HEIGHT))

    print ("Generating image...")
    color = 0
    character = 0
    offset = 0
    for i in range (0,FRAME_HEIGHT):
        for j in range (0,LINE_WIDTH):
            try:
                c = in_string[character+offset]
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
                #print (f"I don't know what {c} is ... at #{character}")
                print(str(e))
                #exit()

            newImg1.putpixel((j,i),(color)) # color should be more like:  (0, 0, 0, 255)

    print("Saving image...")
    newImg1.save(png_filename)
    return

def create_basename(basename=""):
    now = datetime.now()
    basename = basename + now.strftime("%Y-%m-%d_%H-%M_%S")
    print("date and time =", basename)
    return

def create_filename(basename, ext):
    filename = ""
    if (ext == "txt"):
        filename = f"{txt_dir}/{basename}.txt"
    if (ext == "png"):
        filename  = f"{png_dir}/{basename}.png"

    return filename

def load_history():
    x = 0
    onlyfiles = [f for f in os.listdir(txt_dir) if isfile(join(txt_dir, f))]
    for file in onlyfiles:
        if (file.endswith('.txt')): 
            file = file.replace(".txt","")
            if (exists(f"{png_dir}/" + file + ".png")):
                window.list_history.addItem(str(file))
    window.list_history.sortItems(Qt.SortOrder.DescendingOrder)
    return

def list_box_click():
    file_to_load = window.list_history.currentItem().text()
    #png_file = f"{png_dir}/{file_to_load}.png"
    load_png_to_window(file_to_load)

def load_png_to_window(filename):
    png_file = create_filename(filename, "png")
    pixmap = QPixmap(png_file)
    window.lbl_pngview.setPixmap(pixmap)    

def go_go_capture():
    window.btn_connect.enabled = False
    basename = create_basename()
    if (serial_capture(default_SER_PORT, default_SER_SPEED, default_SER_TIMEOUT, create_filename(basename,"txt"))):
        string_block = read_in_txt_file(create_filename(basename,"txt"))
        generate_png(string_block, basename)
        window.list_history.addItem(basename)
        load_png_to_window(basename)
    else:
        print("Serial Fail")
    window.btn_connect.enabled = True

if __name__ == "__main__":
    app = QApplication(sys.argv)

    ui_file_name = "mainwindow.ui"
    ui_file = QFile(ui_file_name)
    if not ui_file.open(QIODevice.ReadOnly):
        print(f"Cannot open {ui_file_name}: {ui_file.errorString()}")
        sys.exit(-1)
    loader = QUiLoader()
    window = loader.load(ui_file)
    ui_file.close()
    if not window:
        print(loader.errorString())
        sys.exit(-1)
    window.btn_connect.clicked.connect(lambda: go_go_capture())
    window.list_history.itemSelectionChanged.connect(lambda: list_box_click())
    load_history()
    window.show()
    sys.exit(app.exec())