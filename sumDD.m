function[fx,fmax] = sumDD(n,D,rc,x,y,b)
% set force component to 0
fx = zeros(n,1);
for i=1:n-1   % note limits
    for j=i+1:n  % note limits
   % minimum image convention
         dx = x(i) - x(j);
         dy = y(i) - y(j);
         dx = dx - D*round(dx/D);
         dy = dy - D*round(dy/D);
         dsq = dx^2 + dy^2;
         dist = sqrt(dsq);
         if dist<=rc
             ffx = b(i)*b(j)*dx*(dx^2-dy^2)/dsq^2;
             fx(i) = fx(i) + ffx;
         % add -f to sum of force on j
             fx(j) = fx(j) - ffx;
         end
    end
end

% calculate maximum value of force
fmax = max(abs(fx));