function c_ij = LNA_many_runs_c_ij(n,j,dt,temp,t, mu)

% calculates c_ij by using the c_ij time evolution equation

steps = round(t/dt);
c_ij=zeros(n,n,steps+1);
for i=1:steps
   c_ij(:,:,i+1)=one_step_c_ij(c_ij(:,:,i),j,mu(:,i), temp, n, dt);
end