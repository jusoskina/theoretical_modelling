% multiple simulation runs for LNA;
% Will update mean and covariances

function [mu, c_ii] = simulate_many_LNA_collect_data(n,x0_glob,j_glob,dt,temp,t)

mu = many_runs_mean(n,x0_glob,j_glob,dt,t);
c_ii = LNA_many_runs_c_ii(n,j_glob,dt,temp,t, mu);

