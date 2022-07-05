function [parent1, parent2] = selectionFunc_RW_test(population)

M = length( population.Chromosomes(:) );

%% Fitness scaling
% If statement will be executed if fitness scaling is required
% Else statement will be executed if not required

if any( [population.Chromosomes(:).fitness] < 0)
    % Fitness Scaling f = a*f + b
    a = 1;
    b = min( [population.Chromosomes(:).fitness.fitness] );
    b = abs(b);

    scaled_fitness_values = a*[population.Chromosomes(:).fitness] + b;
    normalize_fitness_values = [scaled_fitness_values] ./ sum( [scaled_fitness_values] );

else
    %% Normalize the fitness values
    normalize_fitness_values = [population.Chromosomes(:).fitness] ./ sum( [population.Chromosomes(:).fitness] );
end


%%% Normalize the fitness values
%normalize_fitness_values = [population.Chromosomes(:).fitness] ./ sum( [population.Chromosomes(:).fitness] );

%% Sort the normalized fitness values

[sorted_normalize_fitness_values, sorted_idx] = sort(normalize_fitness_values, "descend");

for i = 1: length(population.Chromosomes)
    temp_population.Chromosomes(i).Gene = population.Chromosomes(sorted_idx(i)).Gene;
    temp_population.Chromosomes(i).fitness_values = population.Chromosomes(sorted_idx(i)).fitness;
    temp_population.Chromosomes(i).normalize_fitness_values = normalize_fitness_values(sorted_idx(i));
end

%% Caluculate cumulative sum

cumsum = zeros(1, M);

for i = 1: M
    for j = i: M
        cumsum(i)= cumsum(i) + temp_population.Chromosomes(j).normalize_fitness_values;
    end
end

%% Selecting the parents

%Selecting the first parent

R1 = rand(); %Range [0,1]

parent1_idx = M;

%Writing a custom find function for parent1
for i = 1: length(cumsum)

    if R1 > cumsum(i)
        parent1_idx = i-1;
        break;
    end

end

%Selecting the second parent and also do not end up selecting the first
%parent

parent2_idx = parent1_idx;

while parent2_idx  == parent1_idx
    R2 = rand(); %Range [0,1]


    %Writing a custom find function for parent2
    for i = 1: length(cumsum)

        if R2 > cumsum(i)
            parent2_idx = i-1;
            break;
        end

    end
end

parent1 = temp_population.Chromosomes(parent1_idx);
parent2 = temp_population.Chromosomes(parent2_idx);

end