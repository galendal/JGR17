close all
%hf=figure;
ax1 = subplot(121);
distance1=ut_high(1).distance;
distance2=ut_dist(1).distance;
distance3=ut_cont(1).distance;
PP1=ut_high(1).PP;
PP2=ut_dist(1).PP;
PP3=ut_cont(1).PP;
tmp_dist1=cumsum(distance1)*0.8;
tmp_dist2=cumsum(distance2)*0.8;
tmp_dist3=cumsum(distance3)*0.8;
splt_dist=max(max(tmp_dist2),max(tmp_dist3))

plot(tmp_dist1(tmp_dist1<=splt_dist),PP1(tmp_dist1<=splt_dist),'b-','linewidth',2)
hold on
plot(tmp_dist2,PP2,'-go','linewidth',2,'MarkerIndices',1:100:length(PP2),'MarkerSize',10);
plot(tmp_dist3,PP3,'r-x','linewidth',2,'MarkerIndices',1:100:length(PP3),'MarkerSize',10);
hold off
axis tight;
ylabel('likelihood of a leak in the area','FontSize',17.6)
legend('Highest','Distance','Continuous')
set(gca,'BoxStyle','full','FontSize',12,'FontWeight','bold','Layer','top');
ax2 = subplot(122);
semilogx(tmp_dist1(tmp_dist1>splt_dist),PP1(tmp_dist1>splt_dist),'b-','linewidth',2)
axis tight;
ylim([0 1]);
set(ax1,'units','normalized','position',[0.1 0.1 0.4 0.8]);
set(ax2,'units','normalized','position',[0.5 0.1 0.4 0.8]);
set(ax2,'xscale','log','xlim',[splt_dist 10^5],'yticklabel','');
set([ax1 ax2],'ylim',[0 1],'box','off');
set(ax2,'yticklabel','');
uistack(ax1,'top');
grid(ax1,'on');
grid(ax2,'on');
set(gca,'BoxStyle','full','FontSize',12,'FontWeight','bold','Layer','top');
filenm='prob_vs_dist';
ax = axes('position',[0,0,1,1],'visible','off');
tx = text(0.4,0.03,'distance travelled(km)');

set(tx,'FontSize',12,'FontWeight','bold');
set(gca,'BoxStyle','full','FontSize',12,'FontWeight','bold','Layer','top');
filenm='prob_vs_dist_split';
path='/Users/guttorm/Dropbox/Publisering/JGR2016/3rd/Figs/'
print(gcf,'-dpdf',[path filenm '.pdf'], '-opengl')
print(gcf,'-depsc',[path filenm '.eps'], '-opengl')


