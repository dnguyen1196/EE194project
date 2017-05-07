function matrices = generateMatrices(Y)
    [N,N] = size(Y);
    I = eye(N);
    
    MAT_PSI = [];
    MAT_OMG = [];
    MAT_J   = [];

    for i = 1:N
        ei  = I(:,i);
        J   = ei*ei';
        Yi  = J * Y;
        Psi = (Yi'+Yi)/2;
        OMG = (Yi'-Yi)/2j;

        MAT_PSI(:,:,i) = [real(Psi) -imag(Psi); imag(Psi) real(Psi)];
        MAT_OMG(:,:,i) = [real(OMG) -imag(OMG); imag(OMG) real(OMG)];
        MAT_J(:,:,i) = [real(J) -imag(J); imag(J) real(J)];
    end
    
    matrices(:,:,1:N) = MAT_PSI;
    matrices(:,:,N+1:2*N) = MAT_OMG;
    matrices(:,:,2*N+1:3*N) = MAT_J;
end