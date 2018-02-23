function newImage = scaleImageBWMapNearest(image,scale)

    mMatrix = generateMMatrixScale(image,scale);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);
    
    targetDimensions = getTargetDimensions(image,mMatrix);
    
    newImage = backTransformationNearest(image,targetDimensions,mMatrixFSC);


end

