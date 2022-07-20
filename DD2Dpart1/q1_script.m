ndis = 500;
nsteps = 80;
dxmax = 30;
[xi,x1,y1,b1,fx,xdm] = DD2D(ndis,nsteps,dxmax);
figure(1)
scatter(x1,y1,50,b1,'d','fill');axis square
figure(2)
plot(fx);
