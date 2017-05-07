function S = findS(x, n, MATRICES)
     S = zeros(n*2,n*2);
     for i = 1:(n*3)
        S = S + x(i)*MATRICES(:,:,i);
     end
     S = S + eye(n*2);
end