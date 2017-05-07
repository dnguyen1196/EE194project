

N = 2;
Y = [ 0.5025-0.369j -0.3780+0.369j;
      -0.3780+0.369j  0.5847-0.369j];
  
I = eye(4);
M = generateMatrices(Y);


mat = [];

for i = 1:6
   mat(:,i) = reshape(M(:,:,i),16,1);
end

k = [0; 0; 0; 0; -1; -1];

