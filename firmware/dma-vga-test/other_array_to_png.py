# from: https://stackoverflow.com/questions/19651055/saving-image-with-pil

from PIL import Image

newImg1 = Image.new('RGB', (512,512))

for i in range (0,511):
    for j in range (0,511):
        newImg1.putpixel((i,j),(i+j%256,i,j))

newImg1.save("img1.png")