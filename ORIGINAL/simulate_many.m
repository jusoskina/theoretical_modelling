% example script of how to do multiple simulation runs;
% a correlation function is computed at the end

x_glob=many_runs(n,x0_glob,j_glob,dt,temp,t,n_runs);

x_average = mean(x_glob,1);

times=[0:dt:t];
figure;
plot(times, squeeze(x_average(1,:,:)));
title('Original Mean');

c_ii = variance(x_glob);


figure;
plot(times, c_ii);

title('Original Variance');
