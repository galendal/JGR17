function out=qfunction(x,qq,dim)
%x position of monitoring

[M,I]=max(qq(:));
[I_row, I_col] = ind2sub(size(qq),I);
padX=[I_row-1,size(qq,1)-I_row];
padY=[I_col-1,size(qq,2)-I_col];
Xlow=floor(x(1))-padX(1);
Xup=floor(x(1))+padX(2);
Ylow=floor(x(2))-padY(1);
Yup=floor(x(2)+padY(2));
out=zeros(dim(1),dim(2));
out(max(1,Xlow):Xup,max(1,Ylow):Yup)=1;
out(out==1)=qq(max(1,-Xlow+2):end,max(1,-Ylow+2):end);
out=out(1:dim(1),1:dim(2));
