function newImage = backTransformationNearest(image,targetDimensions,...
    transformation)

    height = size(image,1);
    width = size(image,2);
    
    targetWidth = targetDimensions(1);
    targetHeight = targetDimensions(2);
    
    output = zeros(targetWidth,targetHeight,3);

    for x = 1:targetWidth
        for y = 1:targetHeight
            
            newImagePos = [x, y, 1]';
            currentImagePos = transformation\newImagePos;
            
            xPrime = floor(currentImagePos(1)/currentImagePos(3));
            yPrime = floor(currentImagePos(2)/currentImagePos(3));

            if(xPrime > 0 && xPrime <= width && yPrime > 0 && yPrime <= height)
                output(y, x, :) = image(yPrime,xPrime,:);
            end
            
        end
    end
    newImage = output;
end

