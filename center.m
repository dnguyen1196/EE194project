function x_next = center(x, n, c, t, MATRICES)
    EPS = 0.0001;
    MAXITER = 20;
    ALPHA = 0.1;
    BETA = 0.5;
    prev = findCost(x,n,t,c,MATRICES);
    
    for iter = 1:MAXITER
        hess = findHessian(x, n, MATRICES); % Hessian is not positive
        grad = findGradient(x, n, c, t, MATRICES);
        dx = -pinv(hess)*grad; 
        
        % Newton decrement doesnt't work
%         if grad'*(-dx) < EPS*2
%              break;
%         end
        
        % Make sure x < 0
        st = 1.0;
        for initer = 1:100            
            if sum(x + st*dx > 0) > 0
                st = BETA*st;
            else
                break;
            end
        end
%         disp(x+st*dx);
        val = findCost(x+st*dx,n,t,c,MATRICES);
%         disp('Val')
         disp(val);
        if abs((val-prev)/prev) < EPS && val < prev % Manual stopping criterion
            x = x + st*dx;
            break;
        elseif val > prev 
            break;
        end
        
        x = x + st*dx;        
        prev = val;
        
%         for innerit = 1:MAXITER
%              val_1 = findCost(x + st * dx, n, t, c, MATRICES);
%              if val_1 < val + ALPHA*st*grad'*dx
%                  break 
%              end
%              st = BETA * st;
%         end
        
    end 
    x_next = x;
end