close all
%hf=figure;
ax1 = subplot(121);
tmp_dist1=ut_high(1).totdist*0.8;
tmp_dist2=ut_dist(1).totdist*0.8;
tmp_dist3=ut_cont(1).totdist*0.8;
splt_dist=max(max(tmp_dist2),max(tmp_dist3))

p1=plot(tmp_dist1<=splt_dist),ut_high(1).PP(tmp_dist1<=splt_dist),'-','linewidth',3);
hold on
plot(tmp_dist2,PP2,'-.','linewidth',3)
plot(tmp_dist3,PP3,'--','linewidth',3)
hold off
axis tight;
ylabel('likelihood of a leak in the area','FontSize',17.6)
legend([p1,p2,p3],'Highest','Distance','Continuous')
set(gca,'BoxStyle','full','FontSize',12,'FontWeight','bold','Layer','top');
ax2 = subplot(122);
semilogx(tmp_dist1(tmp_dist1>splt_dist),PP1(tmp_dist1>splt_dist),'-','linewidth',3)
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


