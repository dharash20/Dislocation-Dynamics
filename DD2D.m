function[xi,x,y,b,fx,xdm] = DD2D(ndis,nsteps,dxmax)
% set size of system (arbitrary)
D=1000;
% set cutoff to be 1/2 the box length
rc = D/2;
% initial positions
[x,y,b] = initDD(ndis,D);
% store initial position
xi = x;
% start the time steps
for j=1:nsteps
    [fx,fmax] = sumDD(ndis,D,rc,x,y,b);
    dt = dxmax/fmax;
    for i=1:ndis
        x(i) = x(i) + fx(i)*dt;
        if x(i) > D
            x(i) = x(i) - D;
        end
        if x(i) < 0
            x(i) = x(i) + D;
        end
    end
end
xd = x-xi;                    % change in position over the run
xd = xd - D*round(xd/D);      % remove movement across periodic boundaries
xdm = max(abs(xd));           % find maximum movement