clc
clear

fitness_values = [ 10, 100, 5.5 34, 1000, 1, 200, 150, 90]

%% Normalize the fitness values 

normalize_fitness_values = fitness_values ./ sum(fitness_values);

%% Sort the normalized fitness values

sorted_normalize_fitness_values = sort(normalize_fitness_values, "descend");

%% Caluculate cumulative sum

cumsum = zeros(1, length(fitness_values));

for i = 1: length(fitness_values)
    for j = i: length(fitness_values)
        cumsum(i)= cumsum(i) + sorted_normalize_fitness_values(j);
    end
end

cumsum

%% Select one of the parents

%Selecting the first parent

R1 = rand() %Range [0,1]


%Writing a custom find function
for i = 1: length(cumsum)

    if R1 > cumsum(i)
        parent1 = i-1
        break;
    end
    
end

%Selecting the second parent

R2 = rand() %Range [0,1]


%Writing a custom find function
for i = 1: length(cumsum)

    if R2 > cumsum(i)
        parent2 = i-1
        break;
    end
    
end



