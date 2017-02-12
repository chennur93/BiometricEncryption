function [ precision ] = checker_local( p, ls, n, feature, d, k )
filename=strcat('C_PolyU_',int2str(p),'_F_1','.bmp');
I=imread(filename);
[ histogram ] = lbp_lmep_local( I , ls , d );
C=histogram;
listf=zeros(1,n);
for i = 1:n
tmp=feature{i,1};
% tmp1=cell2mat(tmp);
num = (C)-(tmp);
denom = 1+abs(C)+abs(tmp);
dist_d1 = abs(num.^1)./abs(denom.^1);
L1=reshape(dist_d1,[],1);
sum_col = sum(L1);
listf(1,i) = sum_col;
end
[dist_sort,idx] = sort(listf);
acc=0;
number=7;
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