import cv2
import matplotlib as plt
im = cv2.imread('fruit005.bmp',0)
imN = cv2.bitwise_not(im)
cv2.imshow('Imagen', im)
cv2.imshow('Imagen Negativa', imN)
hist = cv2.calcHist('')
cv2.waitKey(0)
cv2.destroyAllWindows()

