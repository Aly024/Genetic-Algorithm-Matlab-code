function [parent1, parent2] = selection(population)
    
    M = length(population.Choromosomes(:))

    if any([population.Chromosomes(:).fitness]<0) %negative number
        %fitness scaling f_scaled = a*f + b
        a=1;
        b=min([population.Chromosomes(:).fitness]);
        b = abs(b);

        scaled_fitness = a*[population.Chromosomes(:).fitness] + b + 1;
        normalized_fitness_values = [scaled_fitness] ./ sum([scaled_fitness]);

    else %no negative number 
        normalized_fitness_values = [population.Choromosomes(:).fitness]./ sum([population.Choromosomes(:).fitness])
    end
    

    [sorted_normalized_fitness_values, sorted_idx] = sort(normalized_fitness_values, 'descend');

    for i = 1 : length(population.Choromosomes)
        temp_population.Choromosomes(i).Gene = population.Choromosomes(sorted_idx(i)).Gene;
        temp_population.Choromosomes(i).fitness = population.Choromosomes(sorted_idx(i)).fitness;
        temp_population.Choromosomes(i).normalized_fitness_values = sorted_normalized_fitness_values(sorted_idx(i));
    end

    cumsum = zeros(1, M);

    for i = 1: M
        for j = i : M
            cumsum(i) = cumsum(i) + temp_population.Choromosomes(j).normalized_fitness_values;
        end
    end

    R1 = rand();

    for i = 1 : length(cumsum)
        if R1 > cumsum(i)
            parent1_idx= i-1;
            break;
        end
    end

    R2 = rand();

    for i = 1 : length(cumsum)
        if R2 > cumsum(i)
            parent2_idx= i-1;
            break;
        end
    end

    parent1 = temp_population.Choromosomes(parent1_idx);
    parent2 = temp_population.Choromosomes(parent2_idx);


end