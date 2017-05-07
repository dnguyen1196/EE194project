function Y = generateY(n, table, ground)
    % n is number of nodes
    % table is the matrix yij
    % ground is the admittance to ground vector
    % Y_ij = -yij if i != j
    % Else = yi + sum
    admit = generateAdmittance(n, table);
    Y = zeros(n,n);
    for i = 1:n
       for j = 1:n
           if i == j % if on the diagonal
              Y(i,j) = ground(i) + sum(admit(i,:));
           else
              Y(i,j) = -admit(i,j);
           end
       end
    end
end

function admittance = generateAdmittance(n, table)
    admittance = zeros(n,n);
    [m,p] = size(table);
    for i = 1:m
        a = table(i,1);
        b = table(i,2);
        R = table(i,3);
        X = table(i,4);
        Y = 1/(R+1i*X);
        admittance(a,b) = Y;
        admittance(b,a) = Y;
    end
end