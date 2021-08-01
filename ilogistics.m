function decImg = ilogistics(encImg, keyA, keyB)
%ILOGISTICS Decrypt an image using logistics map
%   DECIMG = ilogistics(IMG, KEYA, KEYB) decrypts input grayscale IMG using
%   logistics map based upon user given KEYA and KEYB. KEYA and KEYB can be
%   any scalar 30bit unsigned integer.
%
%   Class Support
%   -------------
%   Supported classes for the input IMG is single, double, int8, int16,
%   int32, int64, uint8, uint16, uint32, uint64.
%
%   Example
%   -------
%   img = imread('cameraman.tif');
%   key1 = input(' Enter the encryption key 1: ');
%   key2 = input(' Enter the encryption key 2: ');
%   encrypImg = logistics(img, key1, key2);
%   decrypImg = logistics(encrypImg, key1, key2);
%   figure
%   montage({img, encrypImg, decrypImg}, 'Size', [1 3])
%   title('Original image(left) | Encrypted image(center) | Decrypted image(right)');
%
%   Reference
%   ---------
%   Devaney, R., An Introduction to Chaotic Dynamical Systems, 2nd
%   edn., Addison-Wesley, Redwood City, CA, 1989.

% Written by: Subhadeep Koley
% CC BY-NC-ND license 2021

% Generate random key
rng(keyA);
maxKeyRange = 2^32;
key = randi(maxKeyRange);

% Calculate vector size
[row, col] = size(encImg);
itr = (row*col);

% Initialze vectors
x = linspace(0, 1, itr);
y = zeros(1, itr);

for idx = 1:itr
    y(idx) = keyB.*x(idx).*(1-x(idx));
end

% Reshape the attractor to be 2D
yRes = reshape(y, [row, col]);

% Create random matrix
randMat = yRes.*yRes;

% Rounding of random matrix
roundRandMat = floor(mod((randMat * key), 256));

% Perform XOR(modulo) encryption
decImg = bitxor(im2uint8(encImg), uint8(roundRandMat));
end