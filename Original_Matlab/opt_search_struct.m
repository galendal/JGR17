function [out]=opt_search_struct(pmap,qq,X,Y,prior, distpen,cont)

out.prior=prior;
out.distpen=distpen;
out.continuous=cont;
out.nmap=prior*pmap;
pos=[1,1]; % dummy
pos=get_pos(pos,out.nmap,qq,X,Y,0);
out.x=[];
out.y=[];
out.PP=[];
out.distance=[];


out.PP(1)=sum(out.nmap(:));
out.QQ(1)=1.-out.PP(1);
out.x(1)=pos(1);
out.y(1)=pos(2);
out.distance(1)=0;
%for ii=2:nmeas
ii=1;
while out.PP(end) > 0.1
    ii=ii+1;
    oldpos=pos;
    npos=get_pos(oldpos,out.nmap,qq,X,Y,distpen);
    direct=sign(npos-oldpos);
    pos=pos+direct*cont+(1-cont)*(npos-pos);
    qf=qfunction(pos,qq,[100,100]);
    denom=1-sum(sum(out.nmap.*qf));
    invdenom=1./denom;
    tmp=(1.-qf)*invdenom;
    out.nmap=out.nmap.*tmp;
    
    out.x(ii)=pos(1);
    out.y(ii)=pos(2);
    out.distance(ii)=sqrt((out.x(ii)-out.x(ii-1))^2+(out.y(ii)-out.y(ii-1))^2);
    out.PP(ii)=sum(out.nmap(:));
    out.PP(end);
    out.QQ(ii)=invdenom*out.QQ(ii-1); 
%      pcolor(log(nmap)); shading interp;
%      caxis([log(10^-9), log(max(pmap(:)))]);
%      hold on
%      plot(y,x,'xb-')
%      hold off
%      pause(0.1);
end

