function c_ij_new = one_step_c_ij(c_ij,j,mu, temp, n, dt)

% c_ij is (n*n)

c_ij_new = zeros(n,n);

for n1=1:n
    for n2=n1:n
        c_ij_new(n1,n2) = c_ij(n1,n2) + dt*(c_ij(n1,n2)*( 2-3*( (mu(n1))^2 + (mu(n2))^2 ) ) + c_ij(n1,n2)*(sum(j(n1,:)) + sum(j(n2, :))));
        if n1 == n2
            c_ij_new(n1,n2) = c_ij_new(n1,n2) + 2*temp*dt;
           % c_ij_new(n1,n2) = c_ij_new(n1,n2) + 2*temp;
        else
            c_ij_new(n2,n1) = c_ij_new(n1,n2);
        end
    end
end