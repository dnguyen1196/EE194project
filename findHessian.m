function Hess = findHessian(x, n, MATRICES)
     Hess = zeros(n*3,n*3);
     s = findS(x,n,MATRICES);
     invs = inv(s);
     for i = 1:(n*3)
         for j = 1:(n*3)
             Hess(i,j) = trace(invs*MATRICES(:,:,i)*invs*MATRICES(:,:,j));
         end
     end
end