function g = findGradient(x, n, c, t, MATRICES)
    g = zeros(n*3,1);
    s = findS(x,n,MATRICES);     
    for i = 1:(n*3)
       g(i) = t*c(i) - trace(inv(s)*MATRICES(i)); 
    end
end

