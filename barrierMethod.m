function X = barrierMethod(x, n,c, MATRICES)
    MAXITER = 10;
    t = 1;
    u = 150;
    EPS = 0.0001;
    
    for iter = 1:MAXITER
        X = center(x, n, c, t, MATRICES);
        disp(x'*c);
        if 1/t < EPS
            break;
        end
        t = u*t;
    end
end