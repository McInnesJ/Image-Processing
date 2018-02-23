function mMatrixFSC = generateFrameCorrection(image,mMatrix)
%Generate M matrix with built in Frame Shift Correction

    [xMin,yMin] = get_x_y_min(image,mMatrix);
    
    mMatrixFSC = [1,0,-xMin; 0,1,-yMin; 0,0,1]*mMatrix;
end



function [xMin,yMin] = get_x_y_min(image,mMatrix)

    corners = getCorners(image);
    
    [transformedTL,transformedTR,transformedBL,transformedBR]...
        = transformCorners(corners,mMatrix);
    
    xCoords = [transformedTL(1),transformedTR(1),transformedBL(1),transformedBR(1)];
    yCoords = [transformedTL(2),transformedTR(2),transformedBL(2),transformedBR(2)];
    
    xMin = round(min(xCoords));
    yMin = round(min(yCoords));
end

function corners = getCorners(image)

    [width,height] = getImageDimensions(image);
    
    topLeft = [1,1,1]';
    topRight = [1,width,1]';
    bottomLeft = [height,1,1]';
    bottomRight = [height,width,1]';
    
    corners = [topLeft,topRight,bottomLeft,bottomRight];

end
function [transformedTL,transformedTR,transformedBL,transformedBR]...
    = transformCorners(corners,mMatrix)
%transform the corners as part of border correction
    
    transformedTL = mMatrix*corners(:,1);
    transformedTR = mMatrix*corners(:,2);
    transformedBL = mMatrix*corners(:,3);
    transformedBR = mMatrix*corners(:,4);
    
end