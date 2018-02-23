function newImage = rotateImageBWMapBiLin(image,angle)

    mMatrix = generateMMatrixRotation(image,angle);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);

    targetDimensions = getTargetDimensions(image,mMatrix);
    
    newImage = backTransformationBiLin(image,targetDimensions,mMatrixFSC);


end

