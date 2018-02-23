function newImage = scaleImageBWMapBiLin(image,angle)

    mMatrix = generateMMatrixScale(image,angle);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);

    targetDimensions = getTargetDimensions(image,mMatrix);
    
    newImage = backTransformationBiLin(image,targetDimensions,mMatrixFSC);


end
