% simulates the original function, as well as Plefka and LNA

tic

%% Declare variables
global dt;
global t;
global n;
global temp;
global j_glob;
global x0_glob;


%% Initialise variables
dt = 0.001;
t=20;
n=4;
temp=0.01;

n_runs=50;
jamp=0.5;
x0amp=1.0;
eta = 0;

j_glob=j_sample_eta(n,jamp,eta);
x0_glob=x0amp*randn(n,1);

%% Run the original simulation
tic

simulate_many

original_time=toc

%% Run LNA
tic

simulate_many_LNA

LNA_time = toc

%% Run Plefka

tic

simulate_many_plefka

Plefka_time = toc