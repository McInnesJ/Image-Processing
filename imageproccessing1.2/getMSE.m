function MSE = getMSE(image,mapDirection,transformation,interpolation,transformValue)

    switch mapDirection
        case 'f'
    
            switch interpolation
                case 'n'
                    
                    switch transformation
                        case 'r'
                            
                            MSE = mseForwardsRotate(image,transformValue);
                            
                        case 's'
                            MSE = mseForwardsScale(image,transformValue);
                            
                            
                        otherwise
                            error('Transformation input must be "r" or "s"');
                    end
                            
                otherwise
                    error('Must use nearest neighbour interpolation for forwards mapping');
                    
            end

            
        case 'b'
            
            switch transformation
                case 'r'
                    
                    switch interpolation
                        case 'n'
    
                            MSE = mseBackRotateNearest(image,transformValue);
                            
                        case 'b'
                            MSE = mseBackRotateBiLin(image,transformValue);
   
                        otherwise
                            error('Interpolation input must be "b" or "n"');
                    end
                    
                case 's'
                    
                    switch interpolation
                        case 'n'
                            MSE = mseBackScaleNearest(image,transformValue);
                            
                        case 'b'
                            MSE = mseBackScaleBiLin(image,transformValue);
                            
                        otherwise
                            error('Interpolation input must be "b" or "n"');
                    end
                    
                otherwise
                    error('Transformation input must be "r" or "s"');
            end
            
        otherwise 
            error('mapDirection must be "f" or "b"');
    end


end

function mse = mseBackRotateNearest(image,angle)

    [width,height] = getImageDimensions(image);
    
    mMatrix = generateMMatrixRotation(image,angle);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);
    
    targetDimensions = getTargetDimensions(image,mMatrix);
    
    testImage = backTransformationNearest(image,targetDimensions,mMatrixFSC);
    
    testImage = backTransformationNearest(testImage,[width,height],inv(mMatrixFSC));
    
    
    sum = [0,0,0]';
    
    for i = 1:width
        for j = 1:height
            originalPixel = image(i,j,:);
            testPixel = testImage(i,j,:);
            
            difference = originalPixel - testPixel;
            differenceSqd = difference.^2;
            
            if size(difference,3) == 3
                sum = sum + [differenceSqd(1),differenceSqd(2),differenceSqd(3)]';
            elseif size(difference,3) == 1
                sum = sum + differenceSqd;
            else
                error('MSE calculation must be performed on an RGB or Greyscale image.');
            end
            
        end
    end
    totImageSum = mean(sum);
    
    denominator = width*height;
    
    mse = totImageSum/denominator;
            
end

function mse = mseBackRotateBiLin(image,angle)

    [width,height] = getImageDimensions(image);
    
    mMatrix = generateMMatrixRotation(image,angle);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);
    
    targetDimensions = getTargetDimensions(image,mMatrix);
    
    testImage = backTransformationBiLin(image,targetDimensions,mMatrixFSC);
    
    testImage = backTransformationBiLin(testImage,[width,height],inv(mMatrixFSC));

    imgshow(testImage)
    
    sum = [0,0,0]';
    
    for i = 1:width
        for j = 1:height
            originalPixel = image(i,j,:);
            testPixel = testImage(i,j,:);
            
            difference = originalPixel - testPixel;
            differenceSqd = difference.^2;
            
            if size(difference,3) == 3
                sum = sum + [differenceSqd(1),differenceSqd(2),differenceSqd(3)]';
            elseif size(difference,3) == 1
                sum = sum + differenceSqd;
            else
                error('MSE calculation must be performed on an RGB or Greyscale image.');
            end
            
        end
    end
    totImageSum = mean(sum);
    
    denominator = width*height;
    
    mse = totImageSum/denominator;
            
end

function mse = mseBackScaleNearest(image,scaleFactor)

    [width,height] = getImageDimensions(image);
    
    mMatrix = generateMMatrixScale(image,scaleFactor);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);
    
    targetDimensions = getTargetDimensions(image,mMatrix);
    
    testImage = backTransformationNearest(image,targetDimensions,mMatrixFSC);
    
    testImage = backTransformationNearest(testImage,[width,height],inv(mMatrixFSC));
    
    
    sum = [0,0,0]';
    
    for i = 1:width
        for j = 1:height
            originalPixel = image(i,j,:);
            testPixel = testImage(i,j,:);
            
            difference = originalPixel - testPixel;
            differenceSqd = difference.^2;
            
            if size(difference,3) == 3
                sum = sum + [differenceSqd(1),differenceSqd(2),differenceSqd(3)]';
            elseif size(difference,3) == 1
                sum = sum + differenceSqd;
            else
                error('MSE calculation must be performed on an RGB or Greyscale image.');
            end
            
        end
    end
    totImageSum = mean(sum);
    
    denominator = width*height;
    
    mse = totImageSum/denominator;
            
end

function mse = mseBackScaleBiLin(image,scaleFactor)

    [width,height] = getImageDimensions(image);
    
    mMatrix = generateMMatrixScale(image,scaleFactor);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);
    
    targetDimensions = getTargetDimensions(image,mMatrix);
    
    testImage = backTransformationBiLin(image,targetDimensions,mMatrixFSC);
    
    testImage = backTransformationBiLin(testImage,[width,height],inv(mMatrixFSC));
    
    
    sum = [0,0,0]';
    
    for i = 1:width
        for j = 1:height
            originalPixel = image(i,j,:);
            testPixel = testImage(i,j,:);
            
            difference = originalPixel - testPixel;
            differenceSqd = difference.^2;
            
            if size(difference,3) == 3
                sum = sum + [differenceSqd(1),differenceSqd(2),differenceSqd(3)]';
            elseif size(difference,3) == 1
                sum = sum + differenceSqd;
            else
                error('MSE calculation must be performed on an RGB or Greyscale image.');
            end
            
        end
    end
    totImageSum = mean(sum);
    
    denominator = width*height;
    
    mse = totImageSum/denominator;
            
end

function mse = mseForwardsRotate(image,angle)

    [width,height] = getImageDimensions(image);
    
    mMatrix = generateMMatrixRotation(image,angle);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);
    
    targetDimensions = getTargetDimensions(image,mMatrix);
    
    testImage = forwardTransformation(image,targetDimensions,mMatrixFSC);
    
    testImage = forwardTransformation(testImage,[width,height],inv(mMatrixFSC));
    
    
    sum = [0,0,0]';
    
    for i = 1:width
        for j = 1:height
            originalPixel = image(i,j,:);
            testPixel = testImage(i,j,:);
            
            difference = originalPixel - testPixel;
            differenceSqd = difference.^2;
            
            if size(difference,3) == 3
                sum = sum + [differenceSqd(1),differenceSqd(2),differenceSqd(3)]';
            elseif size(difference,3) == 1
                sum = sum + differenceSqd;
            else
                error('MSE calculation must be performed on an RGB or Greyscale image.');
            end
            
        end
    end
    totImageSum = mean(sum);
    
    denominator = width*height;
    
    mse = totImageSum/denominator;
            
end

function mse = mseForwardsScale(image,scaleFactor)

    [width,height] = getImageDimensions(image);
    
    mMatrix = generateMMatrixScale(image,scaleFactor);
    mMatrixFSC = generateFrameCorrection(image,mMatrix);
    
    targetDimensions = getTargetDimensions(image,mMatrix);
    
    testImage = forwardTransformation(image,targetDimensions,mMatrixFSC);
    
    testImage = forwardTransformation(testImage,[width,height],inv(mMatrixFSC));
    
    
    sum = [0,0,0]';
    
    for i = 1:width
        for j = 1:height
            originalPixel = image(i,j,:);
            testPixel = testImage(i,j,:);
            
            difference = originalPixel - testPixel;
            differenceSqd = difference.^2;
            
            if size(difference,3) == 3
                sum = sum + [differenceSqd(1),differenceSqd(2),differenceSqd(3)]';
            elseif size(difference,3) == 1
                sum = sum + differenceSqd;
            else
                error('MSE calculation must be performed on an RGB or Greyscale image.');
            end
        end
    end
    totImageSum = mean(sum);
    
    denominator = width*height;
    
    mse = totImageSum/denominator;
            
end