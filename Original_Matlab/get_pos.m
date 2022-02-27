function [pos, dmap,  probmap]= get_pos(oldpos,pmap,qq,X,Y,distpen)

ni=size(pmap,1);
nj=size(pmap,2);
loc_scale=sum(pmap(:));
locmap=pmap/loc_scale;
for jj=1:nj
    for ii=1:ni
        qf=qfunction([single(ii),single(jj)],qq,[ni,nj]);
        denom=1.-sum(sum(locmap.*qf));
        res=locmap.*qf/denom;
        probmap(ii,jj)=sum(res(:));
    end
end

if distpen
    I_row=oldpos(1);
    I_col=oldpos(2);
    dist=max(sqrt((X-X(I_row,I_col)).*(X-X(I_row,I_col))+(Y-Y(I_row,I_col)).*(Y-Y(I_row,I_col))),1e-2);
    dmap=probmap./sqrt(dist);
else
    dmap=probmap;
end
[M,I]=max(dmap(:));
[II, JJ] = ind2sub(size(dmap),I);
pos=[II,JJ];
