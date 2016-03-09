function mu = many_runs_mean(n,x0,j,dt,t)

% usage: x = many_runs(n,x0,j,dt,temp,t,nruns)
% calculate nruns simulation run over time t, with
% timestep dt at temperature temp, from specified initial condition x0
% and with given interaction matrix j

steps = round(t/dt);
mu=zeros(n,steps+1);
mu(:,1)=x0;
for i=1:steps
    mu(:,i+1)=one_step_mean(mu(:,i),j,dt);
end