function [pmap,X,Y]=create_prior;
nwls=15;
rng default
wls=unidrnd(800,2,nwls)+100;
wls=wls/1000;
pmap=ones(100,100);
x=linspace(0,1);
y=linspace(0,1);
[X,Y]=meshgrid(x,y);
for kk=1:nwls
    for ii=1:100
        for jj=1:100
            pmap(ii,jj)=pmap(ii,jj)+100*exp(-(x(ii)-wls(1,kk))^2/(0.015)^2-(y(jj)-wls(2,kk))^2/(0.015)^2);
        end
    end
end
pmap=pmap./sum(pmap(:));
pmap=0.99*pmap; % Leave a small prob that a leak is not present, 
