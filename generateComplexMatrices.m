function matrices = generateComplexMatrices(Y)
    [N,N] = size(Y);
    I = eye(N);
    
    MAT_PSI = [];
    MAT_OMG = [];
    MAT_J   = [];

    for i = 1:N
        ei  = I(:,i);
        J   = ei*ei';
        Yi  = J * Y;
        PSI = (Yi'+Yi)/2;
        OMG = (Yi'-Yi)/2j;

        MAT_PSI(:,:,i) = PSI;
        MAT_OMG(:,:,i) = OMG;
        MAT_J(:,:,i) = J;
    end

    matrices(:,:,1:N) = MAT_PSI;
    matrices(:,:,N+1:2*N) = MAT_OMG;
    matrices(:,:,2*N+1:3*N) = MAT_J;
end