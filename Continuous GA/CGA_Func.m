function [Best_Chrom] = CGA_Func(M,N,MaxGen, Pc, Pm, Er, problem)

%% Convergence curve

cg_curve = zeros(1, MaxGen);

figure;
hold on;


%% Initialization

[population] = initialization(M,N, problem);

for i = 1:M
    population.Chromosomes(i).fitness = problem.objFunc(population.Chromosomes(i).Gene(:));

    plot(population.Chromosomes(i).Gene(1), population.Chromosomes(i).Gene(2), '.k');
end

all_fitness_values = [population.Chromosomes(:).fitness]; %Storing the fitness values
[cg_curve(1), ~] = max(all_fitness_values);

g = 1;
disp( ['Generation #', num2str(g)]);


%% Main loop

for g = 2:MaxGen

    disp( ['Generation #', num2str(g)]);

    %Calculate the fitness values

    for i = 1: M
        population.Chromosomes(i).fitness = Sphere( population.Chromosomes(i).Gene(:) );
        plot(population.Chromosomes(i).Gene(1), population.Chromosomes(i).Gene(2), '.k');
    end

    drawnow

    for k = 1:2:M

        %Selection
        [parent_1, parent_2] = selection_func(population);

        %Crossover
        [child_1 , child_2] = crossover_func(parent_1 , parent_2, Pc, problem);

        %Mutation
        [child_1] = mutation_func(child_1, Pm, problem);
        [child_2] = mutation_func(child_2, Pm, problem);

        new_population.Chromosomes(k).Gene = child_1.Gene;
        new_population.Chromosomes(k+1).Gene = child_2.Gene;

    end

    for i = 1:M
        new_population.Chromosomes(i).fitness = problem.objFunc( new_population.Chromosomes(i).Gene(:) );
    end

    %Elitism
    [new_population] = elitism_func(population, new_population, Er);

    population = new_population;


    all_fitness_values = [ population.Chromosomes(:).fitness ];
    [cg_curve(g), ~] = max(all_fitness_values);
    cg_curve(g)
end

for i =1:M
    population.Chromosomes(i).fitness = problem.objFunc( population.Chromosomes(i).Gene(:));
end

[max_val, index] = sort( [population.Chromosomes(:).fitness], 'descend');

Best_Chrom.Gene = population.Chromosomes(index(1)).Gene;
Best_Chrom.fitness = population.Chromosomes(index(1)).fitness; % may be error

figure;
x = 1: MaxGen;
y = cg_curve;

plot(x,y)

end