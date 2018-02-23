%***** IMAGE INPUT/GENERATION *****

image = double(imread('surrey.png'))./255;

%image = ipv_cheqpattern(500,500,25,25);



%***** IMAGE WARPS *****

filt = lowPassFilter(image,11);

test = rotateImageFWMap(image,45);
% test = rotateImageBWMapNearest(image,45);
% test = rotateImageBWMapBiLin(image,45);
% test = rotateImageBWMapNearest(filt,45);
% test = rotateImageBWMapBiLin(filt,45);
% test = scaleImageFWMap(image,2.5);
% test = scaleImageBWMapNearest(image,2.5);
% test = scaleImageBWMapBiLin(image,2.5);
% test = scaleImageBWMapNearest(filt,2.5);
% test = scaleImageBWMapBiLin(filt,2.5);

% imgshow(filt);
imgshow(test);



%***** MSE CALCULATIONS *****


mse1 = getMSE(image,'f','r','n',45)
mse2 = getMSE(image,'b','r','n',45)
mse3 = getMSE(image,'b','r','b',45)
mse4 = getMSE(filt,'b','r','n',45)
mse5 = getMSE(filt,'b','r','b',45)
mse6 = getMSE(image,'f','s','n',2.5)
mse7 = getMSE(image,'b','s','n',2.5)
mse8 = getMSE(image,'b','s','b',2.5)
mse9 = getMSE(filt,'b','s','n',2.5)
mse10 = getMSE(filt,'b','s','b',2.5)
