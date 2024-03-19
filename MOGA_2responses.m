%% Define the objective functions to be optimized
fun1 = @(x) -gpr_ke_5param.predictFcn(x); % maximize ke
fun2 = @(x) gpr_vr_5param.predictFcn(x);  % minimize vr

%% Define the bounds for the decision variables
lb = [15 15 15 15 0]; % lower bounds
ub = [25 25 25 25 36]; % upper bounds

%% Define the constraint function
Aeq = ones(1, 5); % Equality constraint matrix
beq = 100;        % Equality constraint value

%% Call the multi-objective optimization solver
opts = optimoptions('gamultiobj', 'Display', 'iter', 'PlotFcn', @gaplotpareto);

%% Set additional tuning parameters
opts.PopulationSize = 100;          % Set the population size
opts.CrossoverFraction = 0.8;       % Set the crossover rate
opts.MutationFcn = @mutationadaptfeasible; % Set the mutation function

[x, fval] = gamultiobj(@(x) [fun1(x), fun2(x)], 5, [], [], Aeq, beq, lb, ub, opts);

%% Print the results
disp('Optimal HEA composition:');
disp(x);
xlswrite('Optimal HEA composition_ke_vr2', x)
disp('Optimal objective function values:');
disp(fval);
xlswrite('Optimized_responses_ke_vr2', fval)