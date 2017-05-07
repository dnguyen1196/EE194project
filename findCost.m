function cost = findCost(x, n, t, c, MATRICES)
    s = findS(x, n, MATRICES);
    [R,p] = chol(s);
    logdet = 2*sum(log(diag(R)));
    cost = t*c'*x - logdet;
end