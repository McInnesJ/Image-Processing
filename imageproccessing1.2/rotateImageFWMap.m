function newImage = rotateImageFWMap(image, angle)
    
    mMatrix = generateMMatrixRotation(image,angle);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);
    
    targetDimensions = getTargetDimensions(image,mMatrix);
    
    newImage = forwardTransformation(image,targetDimensions,...
        mMatrixFSC);

end

