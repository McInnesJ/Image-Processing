function filteredImage = lowPassFilter(image, windowDimensions)

    if mod(windowDimensions,2) == 0;
        error('WINDOW DIMENSION MUST BE ODD');
    end

    reach = (windowDimensions - 1)/2;
    [width,height] = getImageDimensions(image);
    
    padded = NaNPad(image,reach);
    
    output = zeros(width,height,size(image,3));
    
    for k = 1:size(image,3)
        channel = padded(:,:,k);
        
        for i = 1+reach:width+reach
            for j = 1+reach:height+reach
                
                imageSubMatrix = channel(i-reach:i+reach,...
                    j-reach:j+reach);
                
                average = mean(mean(imageSubMatrix,'omitnan'),'omitnan');
                
                output(i-reach,j-reach,k) = average;
            end
        end
    end
    filteredImage = output;
end

function paddedImage = NaNPad(image,reach)

    [width,height] = getImageDimensions(image);
    
    output = NaN(reach+width+reach,reach+height+reach,3);
    
    for i = 1+reach:width
        for j = 1+reach:height
            for k = 1:size(image,3)
                output(i,j,k) = image(i,j,k);
            end
        end
    end
    paddedImage = output;
    

%       Might consider performance improvements.
%     output = image;
%     
%     for i = 1:3
%         
%         NaNCol = NaN(reach,height);
%         output(i) = cat(2,NaNCol,output(i));
%         output(i) = cat(2,output(i),NaNCol);
%         
%         NaNRow = NaN((width+(2*reach)),reach);
%         output(i) = cat(1,NaNRow,output(i));
%         output(i) = cat(1,output(i),NaNRow);
%     
%     end
%     
%     paddedImage = output;
    
end