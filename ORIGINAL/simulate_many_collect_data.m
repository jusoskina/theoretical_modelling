% example script of how to do multiple simulation runs;
% a correlation function is computed at the end;
% output as a .txt file

function [mu, c_ii] = simulate_many_collect_data(n,x0_glob,j_glob,dt,temp,t,n_runs)

x_glob=many_runs(n,x0_glob,j_glob,dt,temp,t,n_runs);

x_average = mean(x_glob,1);
mu = squeeze(x_average(1,:,:));
c_ii = variance(x_glob);
