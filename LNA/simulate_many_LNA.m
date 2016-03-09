% multiple simulation runs for LNA;
% Will update mean and covariances


x_mean = many_runs_mean(n,x0_glob,j_glob,dt,t);

times=[0:dt:t];
figure;
plot(times, x_mean);
title('LNA Mean');


%variance calculations
c_ii_LNA = LNA_many_runs_c_ii(n,j_glob,dt,temp,t, x_mean);

figure;
plot(times, c_ii_LNA);
title('LNA Variance');
