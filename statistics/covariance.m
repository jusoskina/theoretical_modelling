function c_ij = covariance( x )
%COVARIANCE of a positions matrix x(nruns, n, timesteps)

runs = size(x,1);
n = size(x, 2);
timesteps = size(x, 3);

c_ij = zeros(n, n, timesteps);
x_mean = mean(x, 1);
xi_xj = zeros(runs, n, n, timesteps);

for run=1:runs
    for particle_i=1:n
        for particle_j=particle_i:n
            for timestep=1:timesteps
             xi_xj(run, particle_i, particle_j, timestep) = x(run, particle_i, timestep)*x(run, particle_j, timestep);
             xi_xj(run, particle_j, particle_i, timestep) = xi_xj(run, particle_i, particle_j, timestep);
            end
        end
    end
end

xi_xj_mean = mean(xi_xj, 1);

for particle_i=1:n
    for particle_j=particle_i:n
        for timestep=1:timesteps
            c_ij(particle_i, particle_j, timestep) = xi_xj_mean(1, particle_i, particle_j, timestep) - x_mean(1, particle_i, timestep) * x_mean(1, particle_j, timestep);
            c_ij(particle_j, particle_i, timestep) = c_ij(particle_i, particle_j, timestep);
        end
    end
end
end

