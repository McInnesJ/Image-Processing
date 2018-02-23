function MSE = MSECompare(image1,image2)

    [width1,height1] = getImageDimensions(image1);
    [width2,height2] = getImageDimensions(image2);
    
    if ~(width1 == width2 && height1 == height2);
        error('Compared images must have the same dimensions.');
    end
    
    sum = [0,0,0]';
    
    for i = 1:width1
        for j = 1:height1
            pixel1 = image1(i,j,:);
            pixel2 = image2(i,j,:);
            
            difference = pixel1 - pixel2;
            differenceSqd = difference.^2;
            
            if size(difference,3) == 3
                sum = sum + [differenceSqd(1),differenceSqd(2),differenceSqd(3)]';
            elseif size(difference,3) == 1
                sum = sum + differenceSqd;
            else
                error('MSE calculation must be performed on an RGB or Greyscale image.');
            end
            
        end
    end
    totImageSum = mean(sum);
    
    denominator = width1*height1;
    
    MSE = totImageSum/denominator;
            
end
