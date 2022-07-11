function [child_1 , child_2] = crossover_func(parent_1 , parent_2, Pc, problem)

    child_1.Gene = zeros(1, problem.nVar);
    child_2.Gene = zeros(1, problem.nVar);

    for k =1:problem.nVar
        beta = rand();
        child_1.Gene(k) = beta .* parent_1.Gene(k) + (1-beta)*parent_2.Gene(k);
        child_2.Gene(k) = (1-beta) .* parent_1.Gene(k) + beta*parent_2.Gene(k);

        if child_1.Gene(k) > problem.ub(k)
            child_1.Gene(k) = problem.ub(k);
        end

        if child_1.Gene(k) < problem.lb(k)
            child_1.Gene(k) = problem.lb(k);
        end

        if child_2.Gene(k) > problem.ub(k)
            child_2.Gene(k) = problem.lb(k);
        end

        if child_2.Gene(k) < problem.lb(k)
            child_2.Gene(k) = problem.lb(k);
        end

    end

    R1 = rand();

    if R1 <= Pc
        child_1 = child_1;
    else
        child_1 = parent_1;
    end

    R2 = rand();

    if R2 <= Pc
        child_2 = child_2;
    else
        child_2 = parent_2;
    end


end