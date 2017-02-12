function [ histogram ] = lbp_lmep_local( I , ls , d )
[sa,sb]=size(I); % 'I' is the Image 'ls' is local matrix size 'd' is no. of overlap pixels
img=int32(I);
%% Forming Matrices for each matrix element
img1=img(2:sa-1,3:sb);
img2=img(1:sa-2,3:sb);
img3=img(1:sa-2,2:sb-1);
img4=img(1:sa-2,1:sb-2);
img5=img(2:sa-1,1:sb-2);
img6=img(3:sa,1:sb-2);
img7=img(3:sa,2:sb-1);
img8=img(3:sa,3:sb);
imgc=img(2:sa-1,2:sb-1);
%% Calculation for LBP
f1=img1-imgc;
f2=img2-imgc;
f3=img3-imgc;
f4=img4-imgc;
f5=img5-imgc;
f6=img6-imgc;
f7=img7-imgc;
f8=img8-imgc;
%% Calculation for LMep Index-1
f1_1=img2-img1;
f2_1=img3-img2;
f3_1=img4-img3;
f4_1=img5-img4;
f5_1=img6-img5;
f6_1=img7-img6;
f7_1=img8-img7;
f8_1=img1-img8;
%% Calculation for LMep Index-2
f1_2=img3-img1;
f2_2=img4-img2;
f3_2=img5-img3;
f4_2=img6-img4;
f5_2=img7-img5;
f6_2=img8-img6;
f7_2=img1-img7;
f8_2=img2-img8;
%% Calculation for LMep Index-3
f1_3=img4-img1;
f2_3=img5-img2;
f3_3=img6-img3;
f4_3=img7-img4;
f5_3=img8-img5;
f6_3=img1-img6;
f7_3=img2-img7;
f8_3=img3-img8;
%% Applying binary condition and Assigning weight for LBP
[ w1 ] = neighbour( f1,sa,sb,0 );
[ w2 ] = neighbour( f2,sa,sb,1 );
[ w3 ] = neighbour( f3,sa,sb,2 );
[ w4 ] = neighbour( f4,sa,sb,3 );
[ w5 ] = neighbour( f5,sa,sb,4 );
[ w6 ] = neighbour( f6,sa,sb,5 );
[ w7 ] = neighbour( f7,sa,sb,6 );
[ w8 ] = neighbour( f8,sa,sb,7 );
%% Applying binary condition and Assigning weight for LMep-1
[ w1_1 ] = neighbour( f1_1,sa,sb,0 );
[ w2_1 ] = neighbour( f2_1,sa,sb,1 );
[ w3_1 ] = neighbour( f3_1,sa,sb,2 );
[ w4_1 ] = neighbour( f4_1,sa,sb,3 );
[ w5_1 ] = neighbour( f5_1,sa,sb,4 );
[ w6_1 ] = neighbour( f6_1,sa,sb,5 );
[ w7_1 ] = neighbour( f7_1,sa,sb,6 );
[ w8_1 ] = neighbour( f8_1,sa,sb,7 );
%% Applying binary condition and Assigning weight for LMep-2
[ w1_2 ] = neighbour( f1_2,sa,sb,0 );
[ w2_2 ] = neighbour( f2_2,sa,sb,1 );
[ w3_2 ] = neighbour( f3_2,sa,sb,2 );
[ w4_2 ] = neighbour( f4_2,sa,sb,3 );
[ w5_2 ] = neighbour( f5_2,sa,sb,4 );
[ w6_2 ] = neighbour( f6_2,sa,sb,5 );
[ w7_2 ] = neighbour( f7_2,sa,sb,6 );
[ w8_2 ] = neighbour( f8_2,sa,sb,7 );
%% Applying binary condition and Assigning weight for LMep-3
[ w1_3 ] = neighbour( f1_3,sa,sb,0 );
[ w2_3 ] = neighbour( f2_3,sa,sb,1 );
[ w3_3 ] = neighbour( f3_3,sa,sb,2 );
[ w4_3 ] = neighbour( f4_3,sa,sb,3 );
[ w5_3 ] = neighbour( f5_3,sa,sb,4 );
[ w6_3 ] = neighbour( f6_3,sa,sb,5 );
[ w7_3 ] = neighbour( f7_3,sa,sb,6 );
[ w8_3 ] = neighbour( f8_3,sa,sb,7 );
%% Weight LBP
L1=w1+w2+w3+w4+w5+w6+w7+w8;
%% Weight LMep-1
L2=w1_1+w2_1+w3_1+w4_1+w5_1+w6_1+w7_1+w8_1;
%% Weight LMep-2
L3=w1_2+w2_2+w3_2+w4_2+w5_2+w6_2+w7_2+w8_2;
%% Weight LMep-3
L4=w1_3+w2_3+w3_3+w4_3+w5_3+w6_3+w7_3+w8_3;
%% Selecting the local method and the overlap size
i=1:ls-d:158-(ls-2)+1;
j=ls-2:ls-d:158;
len_i=length(i);
len_j=length(j);
imgl1=zeros(len_i,len_j,ls-2,ls-2);
imgl2=zeros(len_i,len_j,ls-2,ls-2);
imgl3=zeros(len_i,len_j,ls-2,ls-2);
imgl4=zeros(len_i,len_j,ls-2,ls-2);
for a=1:length(i)
for b=1:length(j)
imgl1(a,b,:,:)=L1(i(a):j(a),i(b):j(b));
imgl2(a,b,:,:)=L2(i(a):j(a),i(b):j(b));
imgl3(a,b,:,:)=L3(i(a):j(a),i(b):j(b));
imgl4(a,b,:,:)=L4(i(a):j(a),i(b):j(b));
end
end
%% Reshaping the matrices and forming local histograms
hist_temp=zeros(len_i,len_j,1024);
for a=1:len_i
for b=1:len_j
TV1=imgl1(a,b,:,:);
TV2=imgl2(a,b,:,:);
TV3=imgl3(a,b,:,:);
TV4=imgl4(a,b,:,:);
C1=reshape(TV1,[],1);
C2=reshape(TV2,[],1);
C3=reshape(TV3,[],1);
C4=reshape(TV4,[],1);
D1=hist(C1,0:255);
D2=hist(C2,0:255);
D3=hist(C3,0:255);
D4=hist(C4,0:255);
D=[D1 D2 D3 D4];
hist_temp(a,b,:)=D;
end
end
histogram=hist_temp;
end