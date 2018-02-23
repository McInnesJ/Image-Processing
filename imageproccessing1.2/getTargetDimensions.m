function targetDimensions = getTargetDimensions(image,mMatrix)

    corners = getCorners(image);
    transformedCorners = transformCorners(corners,mMatrix);
    
    xCoords = getXCoords(transformedCorners);
    yCoords = getYCoords(transformedCorners);
    
    targetWidth = floor(max(xCoords) - min(xCoords) +1);
    targetHeight = floor(max(yCoords) - min(yCoords) +1);
    
    targetDimensions = [targetWidth,targetHeight];
end


function corners = getCorners(image)

    [width,height] = getImageDimensions(image);
    
    topLeft = [1,1,1]';
    topRight = [1,width,1]';
    bottomLeft = [height,1,1]';
    bottomRight = [height,width,1]';

    corners = [topLeft,topRight,bottomLeft,bottomRight];
end

function transformedCorners = transformCorners(corners, mMatrix)
%transform the corners as part of border correction
    
    transformedTL = mMatrix*corners(:,1);
    transformedTR = mMatrix*corners(:,2);
    transformedBL = mMatrix*corners(:,3);
    transformedBR = mMatrix*corners(:,4);
    
    transformedCorners = [transformedTL,transformedTR,transformedBL,transformedBR];
    
end

function xCoords = getXCoords(transformedCorners)
    
    transformedTL = transformedCorners(:,1);
    transformedTR = transformedCorners(:,2);
    transformedBL = transformedCorners(:,3);
    transformedBR = transformedCorners(:,4);
    
     xCoords = [transformedTL(1),transformedTR(1),transformedBL(1),transformedBR(1)];
end
function yCoords = getYCoords(transformedCorners)
    
    transformedTL = transformedCorners(:,1);
    transformedTR = transformedCorners(:,2);
    transformedBL = transformedCorners(:,3);
    transformedBR = transformedCorners(:,4);
    
     yCoords = [transformedTL(2),transformedTR(2),transformedBL(2),transformedBR(2)];
end