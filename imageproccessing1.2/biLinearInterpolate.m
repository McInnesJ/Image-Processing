function pixelColour = biLinearInterpolate(xPrime,yPrime,image)

    [width,height] = getImageDimensions(image);
    
    if floor(xPrime) == 0
        xPrime = 1;
    elseif ceil(xPrime) == (width+1)
        xPrime = width;
    end
    if floor(yPrime) == 0;
        yPrime = 1;
    elseif ceil(yPrime) == (height+1)
        yPrime = hieght;
    end
    
    bottomLeft = [floor(xPrime), floor(yPrime)]';
    bottomRight = [ceil(xPrime), floor(yPrime)]';
    topLeft = [floor(xPrime), ceil(yPrime)]';
    topRight = [ceil(xPrime), ceil(yPrime)]';
    
    ceilWeightY = ceil(yPrime) - yPrime;
    floorWeightY = 1 - ceilWeightY;
    
    ceilWeightX = ceil(xPrime) - xPrime;
    floorWeightX = 1 - ceilWeightX;
    
    pixelColour = [0,0,0];
    
    for i = 1:size(image,3)     
        
        
        step1Left = floorWeightY*image(bottomLeft(1),bottomLeft(2),i) +...
            ceilWeightY*image(topLeft(1),topLeft(2),i);
        
        step1Right = floorWeightY*image(bottomRight(1),bottomRight(2),i) +...
            ceilWeightY*image(topRight(1),topRight(2),i);
        

        pixelColour(1,i) = floorWeightX*step1Left + ceilWeightX*step1Right;
        
    end

end



