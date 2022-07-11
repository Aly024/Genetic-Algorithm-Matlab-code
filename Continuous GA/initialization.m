function [population] = initialization(M,N, problem)

for i = 1: M
    for j = 1: N 
        population.Chromosomes(i).Gene(j) = ( (problem.ub(j) - problem.lb(j))*rand - problem.lb(j) );
    end
end

end