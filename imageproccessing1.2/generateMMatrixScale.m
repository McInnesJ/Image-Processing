function mMatrix = generateMMatrixScale(image, scale)

    centreShift = generateCentreShift(image);
    rotation = generateScaleMatrix(scale);
    
    mMatrix = centreShift\rotation*centreShift;


end


function scaleMatrix = generateScaleMatrix(scale)

    %Returns a 3x3 rotation matrix of given angle. 
    
    scaleMatrix = [scale,0,0; 0,scale,0; 0,0,1];
   
end
function centreShift = generateCentreShift(image)

    [cX,cY] = getImageCentre(image);
    
    centreShift = [1,0,-cX; 0,1,-cY; 0,0,1];

end
function [xCoord,yCoord] = getImageCentre(image)

    [width,height] = getImageDimensions(image);
    
    xCoord = width/2;
    yCoord = height/2;

end

