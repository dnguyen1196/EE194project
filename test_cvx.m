N = 2;
Y = [ 0.5025-0.369j -0.3780+0.369j;
      -0.3780+0.369j  0.5847-0.369j];
  
c = [0.65; 0.65; 0.67; 0.67; 0.9; 0.9];
c = rand(6,1);
u = -(c + rand(6,1)*5);

c = [c; u];

c = [c(2:6);c(8:12)];

I = eye(4);
M = [];

for i = 1:6
   m = rand(4,4);
   M(:,:,i) = (m'+m)/2;
end

% M = generateMatrices(Y);

cvx_begin
variables x(10)
minimize (c'*x)
subject to
    eye(4) +(x(6)-x(1))*M(:,:,2)+(x(7)-x(2))*M(:,:,3)+(x(8)-x(3))*M(:,:,4)+(x(9)-x(4))*M(:,:,5)+(x(10)-x(5))*M(:,:,6) >= 0;
    x >= 0;
cvx_end