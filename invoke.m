%%
clc
clear all
%% Forming a feature vector database
n = input('Please specify the total number of persons : ');
a=1;
feature = cell(n,1);
number=input('Please enter the checking set size :');
%%number1=(10-number)+1;
b=input('Choose a method to compute histogram database \n 1.Global \n 2.Local :');
number1=(10-number)+1;
if (b==2)
ls=input('Please enter the size of the local matrix = ');
d=input('Please enter the number of overlap column = ');
end
fprintf('\n\nPlease wait . . . Creating Feature vector matrix.\n');
tic;
for i = 1:n
fprintf('PERSON NO:=%d . . . Done.\n',i);
for j= number1:10
filename=strcat('C_PolyU_',int2str(i),'_F_',int2str(j),'.bmp');
I=imread(filename);
if (b==1)
[ histogram ] = lbp_lmep( I );
elseif (b==2)
[ histogram ] = lbp_lmep_local( I , ls , d);
end
feature{a,1} = histogram;
a=a+1;
end
end
if (b==1)
save('feature_database_global_F.mat','feature','-v7.3');
elseif(b==2)
save('feature_database_local_F.mat','feature','-v7.3');
end
toc;
fprintf('The Feature vector database for %d persons has been created\n\n',n);