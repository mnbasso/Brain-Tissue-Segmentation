function [results] = performance(csf, gm, wm, imlabel,vol,method,ST,slice,show)

% Performance


%% Label

if strcmp(method,"k-means")
    
    if sum(imlabel(:)) == size(imlabel,1)*size(imlabel,2)
        
        seg_csf = zeros(size(imlabel));
        seg_gm = zeros(size(imlabel));
        seg_wm = zeros(size(imlabel));
        
    else
        
        cluster1 = vol.*uint8((imlabel == 1));
        cluster2 = vol.*uint8((imlabel == 2));
        cluster3 = vol.*uint8((imlabel == 3));
        cluster4 = vol.*uint8((imlabel == 4));
        
        mean_clust = [mean(nonzeros(cluster1),'all'), mean(nonzeros(cluster2),'all'),...
            mean(nonzeros(cluster3),'all'),mean(nonzeros(cluster4),'all')];
        
        mean_clust(isnan(mean_clust))=0;  
        
        [~,I] = sort(mean_clust,2);
        background = imlabel == I(1);
        seg_csf = imlabel == I(2);
        seg_gm = imlabel == I(3);
        seg_wm = imlabel == I(4);
        
    end
    
elseif strcmp(method,"otsu")
    
    if sum(imlabel(:)) == size(imlabel,1)*size(imlabel,2)
        
        seg_csf = zeros(size(imlabel));
        seg_gm = zeros(size(imlabel));
        seg_wm = zeros(size(imlabel));
        
    else
        
        cluster1 = vol.*uint8(imlabel == 1);
        cluster2 = vol.*uint8(imlabel == 2);
        cluster3 = vol.*uint8(imlabel == 3);
        cluster4 = vol.*uint8(imlabel == 4);
        
        mean_clust = [mean(nonzeros(cluster1),'all'), mean(nonzeros(cluster2),'all'),...
            mean(nonzeros(cluster3),'all'),mean(nonzeros(cluster4),'all')];
        
        mean_clust(isnan(mean_clust))=0;  
        
        [~,I] = sort(mean_clust,2);
        background = imlabel == I(1);
        seg_csf = imlabel == I(2);
        seg_gm = imlabel == I(3);
        seg_wm = imlabel == I(4);
        
    end
    
elseif strcmp(method,"gaussian_mixture")
    
    cluster1 = vol.*uint8(imlabel == 1);
    cluster2 = vol.*uint8(imlabel == 2);
    cluster3 = vol.*uint8(imlabel == 3);
    
    mean_clust = [mean(nonzeros(cluster1),'all'), mean(nonzeros(cluster2),'all'),...
        mean(nonzeros(cluster3),'all')];
    
    mean_clust(isnan(mean_clust))=0;
    
    if sum(sum(csf+gm+wm)) == 0
        
        seg_csf = zeros([size(csf,1) size(csf,2)]);
        seg_gm = zeros([size(csf,1) size(csf,2)]);
        seg_wm = zeros([size(csf,1) size(csf,2)]);
        
    else
        
        if and(mean_clust(1) > mean_clust(2),mean_clust(1) > mean_clust(3))
            
            seg_wm = imbinarize(cluster1);
            
        elseif and(mean_clust(1) < mean_clust(2),mean_clust(1) < mean_clust(3))
            
            seg_csf = imbinarize(cluster1);
            
        else
            
            seg_gm = imbinarize(cluster1);
            
        end
        
        
        if and(mean_clust(2) > mean_clust(1),mean_clust(2) > mean_clust(3))
            
            seg_wm = imbinarize(cluster2);
            
        elseif and(mean_clust(2) < mean_clust(1),mean_clust(2) < mean_clust(3))
            
            seg_csf = imbinarize(cluster2);
            
        else
            
            seg_gm = imbinarize(cluster2);
            
        end
        
        
        if and(mean_clust(3) > mean_clust(2),mean_clust(3) > mean_clust(1))
            
            seg_wm = imbinarize(cluster3);
            
        elseif and(mean_clust(3) < mean_clust(2),mean_clust(3) < mean_clust(1))
            
            seg_csf = imbinarize(cluster3);
            
        else
            
            seg_gm = imbinarize(cluster3);
            
        end
        
    end
    
else
    
    error('Error: Incorrect Method Name!');
    
end

%% Plot show GT vs Segmented
if strcmp(show,'true')
    
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(3,3,1)
    imshow(csf);
    title(['Ground truth CSF (ST = ',num2str(ST),'), Slice ',num2str(slice)],'fontweight','bold','fontsize',16);
    subplot(3,3,2)
    imshow(gm);
    title(['Ground truth GM (ST = ',num2str(ST),'), Slice ',num2str(slice)],'fontweight','bold','fontsize',16);
    subplot(3,3,3)
    imshow(wm);
    title(['Ground truth WM (ST = ',num2str(ST),'), Slice ',num2str(slice)],'fontweight','bold','fontsize',16);
    subplot(3,3,4)
    imshow(seg_csf);
    title(['Segmented CSF (ST = ',num2str(ST),'), Slice ',num2str(slice)],'fontweight','bold','fontsize',16);
    subplot(3,3,5)
    imshow(seg_gm);
    title(['Segmented GM (ST = ',num2str(ST),'), Slice ',num2str(slice)],'fontweight','bold','fontsize',16);
    subplot(3,3,6)
    imshow(seg_wm);
    title(['Segmented WM (ST = ',num2str(ST),'), Slice ',num2str(slice)],'fontweight','bold','fontsize',16);
    
    subplot(3,3,7)
    csf_overlay = labeloverlay(csf,seg_csf,'Colormap','autumn','Transparency',0.25);
    imshow(csf_overlay);
    title('CSF GT and Segementation Overlay','fontweight','bold','fontsize',16)
    subplot(3,3,8)
    gm_overlay = labeloverlay(gm,seg_gm,'Colormap','autumn','Transparency',0.25);
    imshow(gm_overlay);
    title('GM GT and Segementation Overlay','fontweight','bold','fontsize',16)
    subplot(3,3,9)
    wm_overlay = labeloverlay(wm,seg_wm,'Colormap','autumn','Transparency',0.25);
    imshow(wm_overlay);
    title('WM GT and Segementation Overlay','fontweight','bold','fontsize',16)
    
end


%% Classification Results

[TP_csf,~,FP_csf,FN_csf] = confusion_matrix(csf,seg_csf);
[TP_gm,~,FP_gm,FN_gm] = confusion_matrix(gm,seg_gm);
[TP_wm,~,FP_wm,FN_wm] = confusion_matrix(wm,seg_wm);

%% Dice Similarity Coefficient

[dsc_csf] = DSC(TP_csf,FP_csf,FN_csf);
[dsc_gm] = DSC(TP_gm,FP_gm,FN_gm);
[dsc_wm] = DSC(TP_wm,FP_wm,FN_wm);

%% Precision, Recall, & F1-score

[precision_csf,recall_csf,f1_csf] = precession_recall_f1(TP_csf,FN_csf,FP_csf);
[precision_gm,recall_gm,f1_gm] = precession_recall_f1(TP_gm,FN_gm,FP_gm);
[precision_wm,recall_wm,f1_wm] = precession_recall_f1(TP_wm,FN_wm,FP_wm);

%% Extra Fraction

[ef_csf] = EF(FP_csf,TP_csf,FN_csf);
[ef_gm] = EF(FP_gm,TP_gm,FN_gm);
[ef_wm] = EF(FP_wm,TP_wm,FN_wm);

%% Overlap Factor Measure

[of_csf] = overlap_factor(TP_csf,FN_csf);
[of_gm] = overlap_factor(TP_gm,FN_gm);
[of_wm] = overlap_factor(TP_wm,FN_wm);

%% VDR Metric

[vdr_csf] = VDR(FP_csf,FN_csf,TP_csf);
[vdr_gm] = VDR(FP_gm,FN_gm,TP_gm);
[vdr_wm] = VDR(FP_wm,FN_wm,TP_wm);

%% Classification Result Vector

results = [dsc_csf,dsc_gm,dsc_wm,of_csf,of_gm,of_wm,...
    precision_csf,precision_gm,precision_wm,recall_csf,recall_gm,recall_wm,...
    f1_csf,f1_gm,f1_wm,ef_csf,ef_gm,ef_wm,vdr_csf,vdr_gm,vdr_wm];


end

