clc
clear

fitness_values = [10, 100, 200, 500 ,20, 93, 23, 430, 11, 30];

%Step 1: Normalize the fitness values
normalized_fitness_values = fitness_values ./ sum(fitness_values);

%Step 2: Sort the normalized fitness values

sorted_normalized_fitness_values = sort(normalized_fitness_values, 'descend');

cumsum = zeros(1, length(fitness_values));

for i = 1: length(fitness_values)
    for j = i: length(fitness_values)
        cumsum(i) = cumsum(i) + sorted_normalized_fitness_values(j)
    end
end 

%Step 3: Selecting individuals to become parents

R1 = rand();

for i = 1 : length(fitness_values)
    if R1 > cumsum(i)
        parent1 = i-1
        break;
    end
end

R2 = rand();

for i = 1 : length(fitness_values)
    if R2 > cumsum(i)
        parent2 = i-1
        break;
    end
end