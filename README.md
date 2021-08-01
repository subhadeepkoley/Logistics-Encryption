# Logistics-Encryption

LOGISTICS.M Encrypt an image using logistics map

ENCIMG = logistics(IMG, KEYA, KEYB) encrypts input grayscale IMG using
logistics map based upon user given KEYA and KEYB. KEYA and KEYB can be
any scalar 30bit unsigned integer.

Class Support
-------------
Supported classes for the input IMG is single, double, int8, int16,
int32, int64, uint8, uint16, uint32, uint64.

Example
-------
img = imread('cameraman.tif');

key1 = input(' Enter the encryption key 1: ');

key2 = input(' Enter the encryption key 2: ');

encrypImg = logistics(img, key1, key2);

figure

montage({img, encrypImg})

title('Original image(left) and Encrypted image(right)');


Reference
---------
Devaney, R., An Introduction to Chaotic Dynamical Systems, 2nd
edn., Addison-Wesley, Redwood City, CA, 1989.

Written by: Subhadeep Koley

CC BY-NC-ND license 2021

---------------------------------------------------------------

ILOGISTICS.M Decrypt an image using logistics map

DECIMG = ilogistics(IMG, KEYA, KEYB) decrypts input grayscale IMG using
logistics map based upon user given KEYA and KEYB. KEYA and KEYB can be
any scalar 30bit unsigned integer.

Class Support
-------------
Supported classes for the input IMG is single, double, int8, int16,
int32, int64, uint8, uint16, uint32, uint64.

Example
-------
img = imread('cameraman.tif');

key1 = input(' Enter the encryption key 1: ');

key2 = input(' Enter the encryption key 2: ');

encrypImg = logistics(img, key1, key2);

decrypImg = logistics(encrypImg, key1, key2);

figure

montage({img, encrypImg, decrypImg}, 'Size', [1 3])

title('Original image(left) | Encrypted image(center) | Decrypted image(right)');

Reference
---------
Devaney, R., An Introduction to Chaotic Dynamical Systems, 2nd
edn., Addison-Wesley, Redwood City, CA, 1989.

Written by: Subhadeep Koley

CC BY-NC-ND license 2021
