N = 2;
C = eye(N*2);

Y = [ 0.5025-0.369j -0.3780+0.369j;
      -0.3780+0.369j  0.5847-0.369j];

MAT_PSI = [];
MAT_OMG = [];
MAT_J   = [];
NEG_MAT_J = [];

for i = 1:N
   ei  = I(:,i);
   J   = ei*ei';
   Yi  = J * Y;
   Psi = (Yi'+Yi)/2;
   OMG = (Yi'-Yi)/2;
   
   MAT_PSI(:,:,i) = [real(Psi) -imag(Psi); imag(Psi) real(Psi)];
   MAT_OMG(:,:,i) = [real(OMG) -imag(OMG); imag(OMG) real(OMG)];
   MAT_J(:,:,i) = [real(J) -imag(J); imag(J) real(J)];
   
   NEG_MAT_J(:,:,i) = -MAT_J(:,:,i);
end

MATRICES(:,:,1:N) = MAT_PSI;
MATRICES(:,:,N+1:2*N) = MAT_OMG;
MATRICES(:,:,2*N+1:3*N) = MAT_J;
MATRICES(:,:,3*N+1:4*N) = NEG_MAT_J;

b = ones(3*N,1);

cvx_begin
    variable X(4,4) semidefinite symmetric
    minimize(trace(C*X));
    subject to
        for i=1:N
            trace(MATRICES(:,:,i)*X) == b(i);
        end
cvx_end