function [mu_plefka, c_ii_plefka] = many_runs_plefka(n,x0,j,dt,t, temp)

% usage: x = many_runs(n,x0,j,dt,temp,t,nruns)
% calculate nruns simulation run over time t, with
% timestep dt at temperature temp, from specified initial condition x0
% and with given interaction matrix j

steps = round(t/dt);

% Define mu(0)
mu_plefka=zeros(n,steps+1);
mu_plefka(:,1)=x0;

% Define c_ii(0)
c_ii_plefka=zeros(n,steps+1);

for i=1:steps
    [mu_plefka(:,i+1), c_ii_plefka(:,i+1)]=one_step_plefka(mu_plefka(:,i),c_ii_plefka(:,i),j,dt, temp);
end