function c_ii = variance(x)
%VARIANCE of a positions matrix x = x(n_runs, n, timesteps)

runs = size(x,1);
n = size(x, 2);
timesteps = size(x, 3);

c_ii = zeros(n, timesteps);
x_mean = mean(x, 1);
x2 = zeros(runs, n, timesteps);

for run=1:runs
    for particle=1:n
        for timestep=1:timesteps
            x2(run, particle, timestep) = x(run, particle, timestep)*x(run, particle, timestep);
        end
    end
end

x2_mean = mean(x2, 1);

for particle=1:n
        for timestep=1:timesteps
            c_ii(particle, timestep) = x2_mean(1, particle, timestep) - x_mean(1, particle, timestep) * x_mean(1, particle, timestep);
        end
end

end

