clc
clear all
%% Image matching and accuracy calculation
m= input('Please enter the no. of people to check : ');
k=input('Please enter the no. of images to be considered for output :');
choice=input('Which case do you want to check \n 1.Global \n 2.Local : ');
fprintf('\n\nPlease wait . . . Computing the code precision.\n\n')
tic
if (choice==1)
load ('feature_database_global_F.mat','feature'); % loading the database
[n,~] = size(feature);
p=zeros(1,m);
for i=1:m
[precision] = checker_global( i, feature, n, k);
p(1,i)=precision;
end
s=sum(p);
Pavg=s./m;
fprintf('\n\nThe average precision of the "global" algorithm among %d persons is = %f percent \n',m,Pavg);
elseif (choice==2)
load ('feature_database_local_F.mat','feature'); % loading the database
[n,~] = size(feature);
ls=input('Please enter the size of the local matrix:');
d=input('Please enter the number of overlap column:');
p=zeros(1,m);
for i=1:m
[ precision ] = checker_local( i, ls, n, feature, d, k );
p(1,i)=precision;
end
s=sum(p);
Pavg=s./m;
fprintf('\n\nThe average precision of the "local" algorithm among %d persons is = %f percent \n',m,Pavg);
toc
end