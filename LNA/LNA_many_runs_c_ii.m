function c_ii = LNA_many_runs_c_ii(n,j,dt,temp,t, mu)

% calculates c_ij by using the c_ij time evolution equation

steps = round(t/dt);
c_ii=zeros(n,steps+1);
for i=1:steps
   c_ii(:,i+1)=one_step_c_ii(c_ii(:,i),j,mu(:,i), temp, n, dt);
end