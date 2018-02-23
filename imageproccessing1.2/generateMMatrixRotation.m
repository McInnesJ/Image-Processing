function mMatrix = generateMMatrixRotation(image, angle)

    theta = deg2rad(angle);
    
    centreShift = generateCentreShift(image);
    rotation = generateRotationMatrix(theta);
    
    mMatrix = centreShift\rotation*centreShift;


end


function rotationMatrix = generateRotationMatrix(angle)

    %Returns a 3x3 rotation matrix of given angle. 
    
    c = cos(angle);
    s = sin(angle);
    
    rotationMatrix = [c,-s,0; s,c,0; 0,0,1];
   
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

