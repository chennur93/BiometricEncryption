function [ w ] = neighbour( g, sa , sb, n )
% The neighbour function point out all the neighbouring
% pixels corresponding to the centre pixel.
for i=(1:sa-2)
for j=(1:sb-2)
if g(i,j)>=0
g(i,j)=1;
else
g(i,j)=0;
end
end
end
b = g;
w=((2^n)*b);
end