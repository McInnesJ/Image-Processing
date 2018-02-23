function newImage = rotateImageBWMapNearest(image,angle)
    
    mMatrix = generateMMatrixRotation(image,angle);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);

    targetDimensions = getTargetDimensions(image,mMatrix);
    
    newImage = backTransformationNearest(image,targetDimensions,mMatrixFSC);
    

end

