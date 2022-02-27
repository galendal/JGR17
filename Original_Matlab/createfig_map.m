function createfig_map(map,x,y,col,filenm)
figure1 = figure('Color',...
    [0.941176474094391 0.941176474094391 0.941176474094391]);
colormap('jet');
axes1 = axes('Parent',figure1);
hold(axes1,'on');
xn=x*0.8;
yn=y*0.8;

xg=0.8*linspace(1,size(map,1),size(map,1));
yg=0.8*linspace(1,size(map,2),size(map,2));

pcolor(xg,yg,log(map));
caxis([col(1), col(2)]);
shading interp
hold on
plot(yn(1:end),xn(1:end),'rx-');

box(axes1,'on');
xlabel('x-direction (km)')
ylabel('y-direction (km)')
% Set the remaining axes properties
set(axes1,'BoxStyle','full','FontSize',12,'FontWeight','bold','Layer','top');
xlim([1,80]);
ylim([1,80]);
c=colorbar;
c.Label.String='log(p)';
hold off
print(figure1,'-dpdf',[filenm '.pdf'], '-opengl')
print(figure1,'-depsc',[filenm '.eps'], '-opengl')

% Create colorbar

