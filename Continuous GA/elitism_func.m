function [new_population] = elitism_func(population, new_population, Er)

    M = length(new_population.Chromosomes);
    elite_no = round(M*Er);

    [max_val, index] = sort( [population.Chromosomes(:).fitness ], 'descend');


    for k = 1: elite_no
        new_population.Chromosomes(k).Gene = population.Chromosomes(index(k)).Gene;
        new_population.Chromosomes(k).fitness = population.Chromosomes(index(k)).fitness;
    end

    for k = elite_no + 1: M
        new_population.Chromosomes(k).Gene = new_population.Chromosomes(k).Gene;
        new_population.Chromosomes(k).fitness = new_population.Chromosomes(k).fitness;
    end

end