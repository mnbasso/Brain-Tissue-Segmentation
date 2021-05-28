function [segmentation_performance_stats,non_filtered_segmentation_performance_stats] = segmentation_performance_plots(vol_seg_performance_ST,vol_seg_performance_ST_no_filtering,noise,ST)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% Filtered Segmentation Performance Plots

n = length(noise);
st = length(ST);

segmentation_performance_stats(1:n) = struct('Noise_Level',[],'DSC_CSF',[],'DSC_GM',[],...
    'DSC_WM',[],'OF_CSF',[],'OF_GM',[],'OF_WM',[],'Precision_CSF',[],'Precision_GM',[],...
    'Precision_WM',[],'Recall_CSF',[],'Recall_GM',[],'Recall_WM',[],...
    'f1_CSF',[],'f1_GM',[],'f1_WM',[],'EF_CSF',[],'EF_GM',[],'EF_WM',[],...
    'VDR_CSF',[],'VDR_GM',[],'VDR_WM',[],'Total_vol_stats',[]);

vol_seg_performance = mean(vol_seg_performance_ST,3);
vol_seg_performance_no_filtering = mean(vol_seg_performance_ST_no_filtering,3);

for i = 1:n
    
    segmentation_performance_stats(i).Noise_Level = noise(i);
    segmentation_performance_stats(i).DSC_CSF  = vol_seg_performance(i,1);
    segmentation_performance_stats(i).DSC_GM  = vol_seg_performance(i,2);
    segmentation_performance_stats(i).DSC_WM  = vol_seg_performance(i,3);
    segmentation_performance_stats(i).OF_CSF  = vol_seg_performance(i,4);
    segmentation_performance_stats(i).OF_GM  = vol_seg_performance(i,5);
    segmentation_performance_stats(i).OF_WM  = vol_seg_performance(i,6);
    segmentation_performance_stats(i).Precision_CSF  = vol_seg_performance(i,7);
    segmentation_performance_stats(i).Precision_GM  = vol_seg_performance(i,8);
    segmentation_performance_stats(i).Precision_WM  = vol_seg_performance(i,9);
    segmentation_performance_stats(i).Recall_CSF  = vol_seg_performance(i,10);
    segmentation_performance_stats(i).Recall_GM  = vol_seg_performance(i,11);
    segmentation_performance_stats(i).Recall_WM  = vol_seg_performance(i,12);
    segmentation_performance_stats(i).f1_CSF  = vol_seg_performance(i,13);
    segmentation_performance_stats(i).f1_GM  = vol_seg_performance(i,14);
    segmentation_performance_stats(i).f1_WM  = vol_seg_performance(i,15);
    segmentation_performance_stats(i).EF_CSF  = vol_seg_performance(i,16);
    segmentation_performance_stats(i).EF_GM  = vol_seg_performance(i,17);
    segmentation_performance_stats(i).EF_WM  = vol_seg_performance(i,18);
    segmentation_performance_stats(i).VDR_CSF  = vol_seg_performance(i,19);    
    segmentation_performance_stats(i).VDR_GM  = vol_seg_performance(i,20);    
    segmentation_performance_stats(i).VDR_WM  = vol_seg_performance(i,21);    
    segmentation_performance_stats(i).Total_vol_stats = vol_seg_performance_ST;
    
end

% Non-Filtered Segmentation Performance Plots

non_filtered_segmentation_performance_stats(1:n) = struct('Noise_Level',[],'DSC_CSF',[],'DSC_GM',[],...
    'DSC_WM',[],'OF_CSF',[],'OF_GM',[],'OF_WM',[],'Precision_CSF',[],'Precision_GM',[],...
    'Precision_WM',[],'Recall_CSF',[],'Recall_GM',[],'Recall_WM',[],...
    'f1_CSF',[],'f1_GM',[],'f1_WM',[],'EF_CSF',[],'EF_GM',[],'EF_WM',[],...
    'VDR_CSF',[],'VDR_GM',[],'VDR_WM',[],'Total_vol_stats',[]);

for i = 1:n
    
    non_filtered_segmentation_performance_stats(i).Noise_Level = noise(i);
    non_filtered_segmentation_performance_stats(i).DSC_CSF  = vol_seg_performance_no_filtering(i,1);
    non_filtered_segmentation_performance_stats(i).DSC_GM  = vol_seg_performance_no_filtering(i,2);
    non_filtered_segmentation_performance_stats(i).DSC_WM  = vol_seg_performance_no_filtering(i,3);
    non_filtered_segmentation_performance_stats(i).OF_CSF  = vol_seg_performance_no_filtering(i,4);
    non_filtered_segmentation_performance_stats(i).OF_GM  = vol_seg_performance_no_filtering(i,5);
    non_filtered_segmentation_performance_stats(i).OF_WM  = vol_seg_performance_no_filtering(i,6);
    non_filtered_segmentation_performance_stats(i).Precision_CSF  = vol_seg_performance_no_filtering(i,7);
    non_filtered_segmentation_performance_stats(i).Precision_GM  = vol_seg_performance_no_filtering(i,8);
    non_filtered_segmentation_performance_stats(i).Precision_WM  = vol_seg_performance_no_filtering(i,9);
    non_filtered_segmentation_performance_stats(i).Recall_CSF  = vol_seg_performance_no_filtering(i,10);
    non_filtered_segmentation_performance_stats(i).Recall_GM  = vol_seg_performance_no_filtering(i,11);
    non_filtered_segmentation_performance_stats(i).Recall_WM  = vol_seg_performance_no_filtering(i,12);
    non_filtered_segmentation_performance_stats(i).f1_CSF  = vol_seg_performance_no_filtering(i,13);
    non_filtered_segmentation_performance_stats(i).f1_GM  = vol_seg_performance_no_filtering(i,14);
    non_filtered_segmentation_performance_stats(i).f1_WM  = vol_seg_performance_no_filtering(i,15);
    non_filtered_segmentation_performance_stats(i).EF_CSF  = vol_seg_performance_no_filtering(i,16);
    non_filtered_segmentation_performance_stats(i).EF_GM  = vol_seg_performance_no_filtering(i,17);
    non_filtered_segmentation_performance_stats(i).EF_WM  = vol_seg_performance_no_filtering(i,18);
    non_filtered_segmentation_performance_stats(i).VDR_CSF  = vol_seg_performance_no_filtering(i,19);    
    non_filtered_segmentation_performance_stats(i).VDR_GM  = vol_seg_performance_no_filtering(i,20);    
    non_filtered_segmentation_performance_stats(i).VDR_WM  = vol_seg_performance_no_filtering(i,21);    
    non_filtered_segmentation_performance_stats(i).Total_vol_stats = vol_seg_performance_ST_no_filtering;
    
end

%% DSC vs Additive Noise 

figure('units','normalized','outerposition',[0 0 1 1]);

plot(noise,vol_seg_performance(:,1),'-o','LineWidth',3);
hold on
plot(noise,vol_seg_performance(:,2),'-o','LineWidth',3);
plot(noise,vol_seg_performance(:,3),'-o','LineWidth',3);
hold off
xticks(noise);

title('DSC vs Noise Level: Segmentation Performance','fontweight','bold','fontsize',16);
ylabel('DSC','fontweight','bold','fontsize',16);
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',16);
legend('CSF','GM','WM','fontweight','bold','fontsize',12);

%% DSC of Filtered vs Non-Filtered Images 

figure('units','normalized','outerposition',[0 0 1 1]);
subplot(1,2,1)

plot(noise,vol_seg_performance(:,1),'-o','LineWidth',3);
hold on
plot(noise,vol_seg_performance(:,2),'-o','LineWidth',3);
plot(noise,vol_seg_performance(:,3),'-o','LineWidth',3);

plot(noise,vol_seg_performance_no_filtering(:,1),'--o','LineWidth',3);
plot(noise,vol_seg_performance_no_filtering(:,2),'--o','LineWidth',3);
plot(noise,vol_seg_performance_no_filtering(:,3),'--o','LineWidth',3);
hold off
xticks(noise);

title('DSC vs Noise Level: Segmentation Performance','fontweight','bold','fontsize',20);
ylabel('DSC','fontweight','bold','fontsize',20);
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',20);
legend('CSF Filtered','GM Filtered','WM Filtered','CSF Non-Filtered','GM Non-Filtered','WM Non-Filtered','fontweight','bold','fontsize',16);

%% DSC vs ST

subplot(1,2,2)

plot(ST,reshape(mean(vol_seg_performance_ST(:,1,:),1),1,st),'-o','LineWidth',3);
hold on
plot(ST,reshape(mean(vol_seg_performance_ST(:,2,:),1),1,st),'-o','LineWidth',3);
plot(ST,reshape(mean(vol_seg_performance_ST(:,3,:),1),1,st),'-o','LineWidth',3);
hold off
xticks(ST);

title('DSC vs Slice Thickness: Segmentation Performance','fontweight','bold','fontsize',20);
ylabel('DSC','fontweight','bold','fontsize',20);
xlabel('Slice Thickness (mm)','fontweight','bold','fontsize',20);
legend('CSF','GM','WM','fontweight','bold','fontsize',16);

%% Overlap Fraction

figure('units','normalized','outerposition',[0 0 1 1]);
subplot(1,2,1)
plot(noise,vol_seg_performance(:,4),'-o','LineWidth',3);
hold on
plot(noise,vol_seg_performance(:,5),'-o','LineWidth',3);
plot(noise,vol_seg_performance(:,6),'-o','LineWidth',3);
hold off
xticks(noise);

title('OF vs Noise Level: Segmentation Performance','fontweight','bold','fontsize',20);
ylabel('OF','fontweight','bold','fontsize',20);
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',20);
legend('CSF','GM','WM','fontweight','bold','fontsize',16);

%% Extra Fraction

subplot(1,2,2)
plot(noise,vol_seg_performance(:,16),'-o','LineWidth',3);
hold on
plot(noise,vol_seg_performance(:,17),'-o','LineWidth',3);
plot(noise,vol_seg_performance(:,18),'-o','LineWidth',3);
hold off
xticks(noise);

title('EF vs Noise Level: Segmentation Performance','fontweight','bold','fontsize',20);
ylabel('EF','fontweight','bold','fontsize',20);
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',20);
legend('CSF','GM','WM','fontweight','bold','fontsize',16);

%% DSC before and after filtering

% Filtered Segementation
n0_CSF = reshape(vol_seg_performance_ST(1,1,:),1,st);
n1_CSF = reshape(vol_seg_performance_ST(2,1,:),1,st);
n3_CSF = reshape(vol_seg_performance_ST(3,1,:),1,st);
n5_CSF = reshape(vol_seg_performance_ST(4,1,:),1,st);
n7_CSF = reshape(vol_seg_performance_ST(5,1,:),1,st);
n9_CSF = reshape(vol_seg_performance_ST(6,1,:),1,st);

n0_GM = reshape(vol_seg_performance_ST(1,2,:),1,st);
n1_GM = reshape(vol_seg_performance_ST(2,2,:),1,st);
n3_GM = reshape(vol_seg_performance_ST(3,2,:),1,st);
n5_GM = reshape(vol_seg_performance_ST(4,2,:),1,st);
n7_GM = reshape(vol_seg_performance_ST(5,2,:),1,st);
n9_GM = reshape(vol_seg_performance_ST(6,2,:),1,st);

n0_WM = reshape(vol_seg_performance_ST(1,3,:),1,st);
n1_WM = reshape(vol_seg_performance_ST(2,3,:),1,st);
n3_WM = reshape(vol_seg_performance_ST(3,3,:),1,st);
n5_WM = reshape(vol_seg_performance_ST(4,3,:),1,st);
n7_WM = reshape(vol_seg_performance_ST(5,3,:),1,st);
n9_WM = reshape(vol_seg_performance_ST(6,3,:),1,st);

% Non-filtered Segementation

n0_CSF_no_filt = reshape(vol_seg_performance_ST_no_filtering(1,1,:),1,st);
n1_CSF_no_filt = reshape(vol_seg_performance_ST_no_filtering(2,1,:),1,st);
n3_CSF_no_filt = reshape(vol_seg_performance_ST_no_filtering(3,1,:),1,st);
n5_CSF_no_filt = reshape(vol_seg_performance_ST_no_filtering(4,1,:),1,st);
n7_CSF_no_filt = reshape(vol_seg_performance_ST_no_filtering(5,1,:),1,st);
n9_CSF_no_filt = reshape(vol_seg_performance_ST_no_filtering(6,1,:),1,st);

n0_GM_no_filt = reshape(vol_seg_performance_ST_no_filtering(1,2,:),1,st);
n1_GM_no_filt = reshape(vol_seg_performance_ST_no_filtering(2,2,:),1,st);
n3_GM_no_filt = reshape(vol_seg_performance_ST_no_filtering(3,2,:),1,st);
n5_GM_no_filt = reshape(vol_seg_performance_ST_no_filtering(4,2,:),1,st);
n7_GM_no_filt = reshape(vol_seg_performance_ST_no_filtering(5,2,:),1,st);
n9_GM_no_filt = reshape(vol_seg_performance_ST_no_filtering(6,2,:),1,st);

n0_WM_no_filt = reshape(vol_seg_performance_ST_no_filtering(1,3,:),1,st);
n1_WM_no_filt = reshape(vol_seg_performance_ST_no_filtering(2,3,:),1,st);
n3_WM_no_filt = reshape(vol_seg_performance_ST_no_filtering(3,3,:),1,st);
n5_WM_no_filt = reshape(vol_seg_performance_ST_no_filtering(4,3,:),1,st);
n7_WM_no_filt = reshape(vol_seg_performance_ST_no_filtering(5,3,:),1,st);
n9_WM_no_filt = reshape(vol_seg_performance_ST_no_filtering(6,3,:),1,st);

% DSC for CSF Before & After Filtering
figure('units','normalized','outerposition',[0 0 1 1]);

x=[n0_CSF n0_CSF_no_filt n1_CSF n1_CSF_no_filt n3_CSF n3_CSF_no_filt n5_CSF n5_CSF_no_filt n7_CSF n7_CSF_no_filt n9_CSF n9_CSF_no_filt]; 
n=length(n0_CSF) ; xx=([1:12])'; % example 
r=repmat(xx,1,n)'; 
g=r(:)'; 


positions = [1 2 3 4 5 6 7 8 9 10 11 12]; 
h=boxplot(x,g, 'positions', positions); 
set(h,'linewidth',2) 

set(gca,'xtick',[mean(positions(1:2)) mean(positions(3:4)) mean(positions(5:6)) mean(positions(7:8)) mean(positions(9:10)) mean(positions(11:12))]) 
set(gca,'xticklabel',{'0','1','3','5','7','9'},'Fontsize',12) 

color = ['c', 'y', 'c', 'y','c', 'y','c', 'y','c', 'y','c', 'y']; 
h = findobj(gca,'Tag','Box'); 

for j=1:length(h) 
patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5); 
end 
legend('Non-Filtered CSF','Filtered CSF');
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',16);
ylabel('DSC','fontweight','bold','fontsize',16);
title('DSC for CSF Before & After Filtering','fontweight','bold','fontsize',16);

% DSC for GM Before & After Filtering
figure('units','normalized','outerposition',[0 0 1 1]);

x=[n0_GM n0_GM_no_filt n1_GM n1_GM_no_filt n3_GM n3_GM_no_filt n5_GM n5_GM_no_filt n7_GM n7_GM_no_filt n9_GM n9_GM_no_filt]; 
n=length(n0_GM) ; xx=([1:12])'; % example 
r=repmat(xx,1,n)'; 
g=r(:)'; 


positions = [1 2 3 4 5 6 7 8 9 10 11 12]; 
h=boxplot(x,g, 'positions', positions); 
set(h,'linewidth',2) 

set(gca,'xtick',[mean(positions(1:2)) mean(positions(3:4)) mean(positions(5:6)) mean(positions(7:8)) mean(positions(9:10)) mean(positions(11:12))]) 
set(gca,'xticklabel',{'0','1','3','5','7','9'},'Fontsize',12) 

color = ['c', 'y', 'c', 'y','c', 'y','c', 'y','c', 'y','c', 'y']; 
h = findobj(gca,'Tag','Box'); 

for j=1:length(h) 
patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5); 
end 
legend('Non-Filtered CSF','Filtered CSF');
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',16);
ylabel('DSC','fontweight','bold','fontsize',16);
title('DSC for GM Before & After Filtering','fontweight','bold','fontsize',16);

% DSC for WM Before & After Filtering
figure('units','normalized','outerposition',[0 0 1 1]);

x=[n0_WM n0_WM_no_filt n1_WM n1_WM_no_filt n3_WM n3_WM_no_filt n5_WM n5_WM_no_filt n7_WM n7_WM_no_filt n9_WM n9_WM_no_filt]; 
n=length(n0_WM) ; xx=([1:12])'; % example 
r=repmat(xx,1,n)'; 
g=r(:)'; 


positions = [1 2 3 4 5 6 7 8 9 10 11 12]; 
h=boxplot(x,g, 'positions', positions); 
set(h,'linewidth',2) 

set(gca,'xtick',[mean(positions(1:2)) mean(positions(3:4)) mean(positions(5:6)) mean(positions(7:8)) mean(positions(9:10)) mean(positions(11:12))]) 
set(gca,'xticklabel',{'0','1','3','5','7','9'},'Fontsize',12) 

color = ['c', 'y', 'c', 'y','c', 'y','c', 'y','c', 'y','c', 'y']; 
h = findobj(gca,'Tag','Box'); 

for j=1:length(h) 
patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5); 
end 
legend('Non-Filtered CSF','Filtered CSF');
xlabel('Additive Noise Level (%)','fontweight','bold','fontsize',16);
ylabel('DSC','fontweight','bold','fontsize',16);
title('DSC for WM Before & After Filtering','fontweight','bold','fontsize',16);

%% Scroll

GTscroll;

end

