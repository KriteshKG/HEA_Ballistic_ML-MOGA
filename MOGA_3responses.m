% Define the objective functions
fitnessfcn = @(x) [-gpr_ke.predictFcn(x), gpr_pd_5param.predictFcn(x), gpr_vr_5param.predictFcn(x)];

%% Define the number of variables
nvars = 5;

%% Define the lower and upper bounds
lb = [15 15 15 15 0];
ub = [25 25 25 25 36];

%% Define the constraint function
Aeq = ones(1, 5); % Equality constraint matrix
beq = 100;        % Equality constraint value

% Define the constraint function
%constr = @(x) 100 - sum(x);

% Define the constraint type (nonlinear inequality)
%nonlcon = @(x) constr(x);

%% Define the options for the genetic algorithm
opts = optimoptions('gamultiobj', 'Display', 'iter', 'PlotFcn', @gaplotpareto);

%% Define the options for the genetic algorithm
%options = optimoptions('gamultiobj', 'PlotFcn', @gaplotpareto);

% Add the constraint function to the options
%options.ConstraintTolerance = 1e-6;

%% Run the multi-objective genetic algorithm
% Set additional tuning parameters
opts.PopulationSize = 100;          % Set the population size
opts.CrossoverFraction = 0.8;       % Set the crossover rate
opts.MutationFcn = @mutationadaptfeasible; % Set the mutation function

%% Run the multi-objective genetic algorithm
[x, fval] = gamultiobj(fitnessfcn, 5, [], [], Aeq, beq, lb, ub, opts);

%[x, fval] = gamultiobj(fitnessfcn, nvars, [], [], [], [], lb, ub, options);

%% Extract the results
ke = -fval(:, 1); % Maximizing KE
pd = fval(:, 2);  % Minimizing PD
vr = fval(:, 3);  % Minimizing Vr
%% Plot the Pareto front
figure;
plot(pd, vr, 'o');
xlabel('PD');
ylabel('Vr');
title('Pareto Front');
%% Plot the individual objectives
figure;
subplot(3, 1, 1);
plot(ke, 'o');
ylabel('KE');
title('Maximization');

subplot(3, 1, 2);
plot(pd, 'o');
ylabel('PD');
title('Minimization');

subplot(3, 1, 3);
plot(vr, 'o');
ylabel('Vr');
title('Minimization');

%% Print the results
disp('Optimal HEA composition:');
disp(x);
xlswrite('Optimal HEA composition_ga_vr', x)
disp('Optimal objective function values:');
disp(fval);
xlswrite('Optimized_responses_ga_vr', fval)
