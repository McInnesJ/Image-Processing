function newImage = forwardTransformation(image,targetDimensions,...
    transformation)

    height = size(image,1);
    width = size(image,2);
    
    targetWidth = targetDimensions(1);
    targetHeight = targetDimensions(2);
    
    output = zeros(targetWidth,targetHeight,3);

    for x = 1:width
        for y = 1:height

            currentPosition = [x, y, 1]';
            newPosition = transformation * currentPosition;
            
            xPrime = floor(newPosition(1)/newPosition(3));
            yPrime = floor(newPosition(2)/newPosition(3));

            if(xPrime > 0 && xPrime <= targetWidth && yPrime > 0 && yPrime <= targetHeight)
                output(yPrime, xPrime, :) = image(y,x,:);
            end
        end
    end
    newImage = output;
end
