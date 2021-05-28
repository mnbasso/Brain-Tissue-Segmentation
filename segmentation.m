function [vol_imlabel] = segmentation(vol,clusters,method,attempts,show)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% k-Means

if strcmp(method,"k-means")
    
    for i = 1:size(vol,3)
        
        [slice_imlabel,~] = imsegkmeans(vol(:,:,i),clusters,'NumAttempts',attempts);

        if strcmp(show,'true')
            
            figure
            subplot(1,2,1);
            imshow(vol(:,:,i),[]);
            xlabel('(a)','fontweight','bold','fontsize',16);
            
            subplot(1,2,2);
            imshow(slice_imlabel,[]);
            xlabel('(b)','fontweight','bold','fontsize',16);
            
        end
        
        vol_imlabel(:,:,i) = slice_imlabel;
        
    end
    
    GTscroll;
    
    % Otsu thresholding
    
elseif strcmp(method,"otsu")
    
    for i = 1:size(vol,3)
        thresh = multithresh(vol(:,:,i),clusters-1);
        imlabel = imquantize(vol(:,:,i),thresh);
        
        vol_imlabel(:,:,i) = imlabel;
        
        if strcmp(show,'true')
            
            figure
            ax1 = subplot(1,3,1);
            imagesc(vol(:,:,i));
            colormap(ax1,gray);
            title('Original Image')
            
            ax2 = subplot(1,3,2);
            imagesc(imlabel);
            colormap(ax2,gray);
            colorbar;
            title('Otsu Labeled Image');
            
            subplot(1,3,3);
            histogram(imlabel);
            title('Histogram of Labeled Image');
            xlabel('Label');
            ylabel('Number of Occurences');
            
        end
    end
    
    GTscroll;
    
elseif strcmp(method,"gaussian_mixture")
    
    for i = 1:size(vol,3)
        
        vol_img = vol(:,:,i);
        
        if sum(sum(vol_img))>0
            
            Igm = single(vol_img(vol_img>0));
            
            options = statset('Display','off','MaxIter',1000,'TolFun',1e-5);
            gm = fitgmdist(Igm,clusters-1,'RegularizationValue',0.01,'Options',options);
            
            idx = cluster(gm,single(vol_img(:)));
            
            imlabel = reshape(idx,[size(vol_img,1) size(vol_img,2)]);
            
        else
            
            imlabel = ones(size(vol_img,1),size(vol_img,2));
            
        end
        
        vol_imlabel(:,:,i) = imlabel;
        
        if strcmp(show,'true')
            
            figure
            ax1 = subplot(1,3,1);
            imagesc(vol_img);
            colormap(ax1,gray);
            title('Original Image')
            
            ax2 = subplot(1,3,2);
            imagesc(imlabel);
            colormap(ax2,gray);
            colorbar;
            title('Gaussian Mixture Model Labeled Image');
            
            subplot(1,3,3);
            histogram(imlabel);
            title('Histogram of Labeled Image');
            xlabel('Label');
            ylabel('Number of Occurences');
        end
    end
    
    GTscroll;
    
else
    error('Error: Incorrect method name!');
    
end

end

