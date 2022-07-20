function[x,y,b] = initDD(n,D)
% we use the rand function, which creates a 1D array of random numbers
% between 0 and 1
x = rand(n,1)*D;
y = rand(n,1)*D;
b = zeros(n,1);
% assign b with equal numbers of +1 and -1
for i = 1:n/2
    b(i) = 1;
end
for i = n/2+1:n
    b(i) = -1;
end