% multiple simulation runs for LNA;
% Will update mean and covariances

%% Mean And Variance

[mu_plefka, c_ii_plefka] = many_runs_plefka(n,x0_glob,j_glob,dt,t,temp);

times=[0:dt:t];
figure;
plot(times, mu_plefka);
title('Plefka Mean');

figure;
plot(times, c_ii_plefka);
title('Plefka Variance');
