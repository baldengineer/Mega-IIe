# Python program to convert
# numpy array to image

# from: https://www.geeksforgeeks.org/convert-a-numpy-array-to-an-image/
  
# import required libraries
import numpy as np
from PIL import Image as im
  
# define a main function
def main():
  
    # create a numpy array from scratch
    # using arange function.
    # 1024x768 = 786432
    # of pixels.
    # np.uint8 is a data type containing
    # numbers ranging from 0 to 255 
    # and no non-negative integers
    array = np.arange(0, 786432, 1, np.uint8)
      
    # check type of array
    print("Array type: " + str(type(array)))
      
    # our array will be of width 
    # 786432 pixels That means it 
    # will be a long dark line
    print("Array shape: " + str(array.shape))
      
    # Reshape the array into a 
    # familiar resoluition
    array = np.reshape(array, (768, 1024))
      
    # show the shape of the array
    print("New Array shape: " + str(array.shape))
  
    # show the array
    #print("The array: " + str(array))
    for x in range(768):
     for y in range(1024):
       array[x,y] = 511

    # creating image object of
    # above array
    data = im.fromarray(array)
    

      
    # saving the final output 
    # as a PNG file
    data.save('gfg_dummy_pic.png', mode='RGB')
  
# driver code
if __name__ == "__main__":
    
  # function call
  main()



# from PIL import Image
# newImg1 = Image.new('RGB', (512,512))
# for i in range (0,511):
#     for j in range (0,511):
#         newImg1.putpixel((i,j),(i+j%256,i,j))
# newImg1.save("img1.png")