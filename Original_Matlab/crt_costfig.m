tmp=[];
figure1 = figure('Color',...
    [0.941176474094391 0.941176474094391 0.941176474094391]);
%colormap('jet');
%colormap([gray(34);hsv(64)])
axes1 = axes('Parent',figure1);
hold(axes1,'on');
frac=[0.0001, 0.001,0.01,0.1,0.5,1,1.5, 2, 10]; 
filenm='cost_cont_vs_dist';
%filenm='cost_cont_vs_high';
%filenm='cost_dist_vs_high';
for ii=1:length(frac)
    tmp(ii,:)=(numm3+frac(ii)*dist3)./(numm2+frac(ii)*dist2);
   % tmp(ii,:)=(numm3+frac(ii)*dist3)./(numm1+frac(ii)*dist1);
   %tmp(ii,:)=(numm2+frac(ii)*dist2)./(numm1+frac(ii)*dist1);
end
mymap=[0.8,0.8,0.8
    1.,1,1];
[C,h]=contourf(frac,ptarget,tmp',[1,1],'Color','w','LineWidth',0.1);
set(gcf, 'colormap',mymap)
%colormap(mymap)
cntrs=[1.2,1.1,1.05,1,0.9,0.8,0.7,0.5,0.3, 0.1];
[C,h]=contour(frac,ptarget,tmp',cntrs,'Color','k','LineWidth',2);
clabel(C,h,'FontSize',15)
set(gca,'xscale','log','CLim',[0 4])
hold on
[C,h]=contour(frac,ptarget,tmp',[1,1],'Color','k','LineWidth',4);
clabel(C,h,'FontSize',15)
box(axes1,'on');
xlabel('Cost fraction distance/measurement')
ylabel('Probability of a leak in the area')
% Set the remaining axes properties
set(axes1,'BoxStyle','full','FontSize',12,'FontWeight','bold','Layer','top');
hold off

path='/Users/guttorm/Dropbox/Publisering/JGR2016/3rd/Figs/'
print(gcf,'-dpdf',[path filenm '.pdf'], '-opengl')
print(gcf,'-depsc',[path filenm '.eps'], '-opengl')