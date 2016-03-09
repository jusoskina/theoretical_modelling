function mu_new = one_step_mean(mu,j,dt)

% calculate one timestep dt update from x to xnew at temperature temp
% using specified drift function

mu_new = mu + dt*(mu-mu.*mu.*mu + j*mu);