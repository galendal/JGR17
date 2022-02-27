load qq;
[pmap,X,Y]=create_prior;
priors=[0.9900 ]%   0.9500    0.9000    0.5000];
for ii=1:length(priors)
% ut_cont(ii)=opt_search_struct(pmap,qq,X,Y,priors(ii), 1,1);
% ut_dist(ii)=opt_search_struct(pmap,qq,X,Y,priors(ii), 1,0);
 ut_high(ii)=opt_search_struct(pmap,qq,X,Y,priors(ii), 0,0);
%ut_highc(ii)=opt_search_struct(pmap,qq,X,Y,priors(ii), 1,1);
end
% save ut_cont;
% save ut_dist;
% save ut_high;
%save ut_highc;