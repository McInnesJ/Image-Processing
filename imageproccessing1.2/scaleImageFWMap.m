function newImage = scaleImageFWMap(image,scale)

    mMatrix = generateMMatrixScale(image,scale);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);
    
    targetDimensions = getTargetDimensions(image,mMatrix);
    
    newImage = forwardTransformation(image,targetDimensions,mMatrixFSC);


end

