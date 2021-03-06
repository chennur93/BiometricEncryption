function [ precision ] = checker_global( p, feature, n, k )
filename=strcat('C_PolyU_',int2str(p),'_F_7','.bmp');
I=imread(filename);
[ histogram ] = lbp_lmep(I);
C=histogram;
listf=zeros(1,n);
for i = 1:n
num = (C)-(feature{i,1});
denom = 1+abs(C)+abs(feature{i,1});
dist_d1 = abs(num.^1)./abs(denom.^1);
sum_col = sum(dist_d1);
listf(1,i) = sum_col;
end
[dist_sort,idx] = sort(listf);
acc=0;
number=3;
for j=1:k
for o=1:number
if (idx(1,j)==(((p-1)*number)+o))
acc=acc+1;
break
end
end
end
inacc=k-acc;
precision=round(100*(acc./(acc+inacc)));
end