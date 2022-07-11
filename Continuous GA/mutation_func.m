function [child] = mutation_func(child, Pm, problem)

    Gene_no = length(child.Gene);

    for k = 1: Gene_no
        R = rand();

        if R < Pm
            child.Gene(k) = (problem.ub(k) - problem.lb(k)*rand() + problem.lb(k));
        end
    end

end