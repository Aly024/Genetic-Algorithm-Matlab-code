function [population] = initilization(M,N)

for i = 1:M
    for j = 1:N

        population.Chromosomes(i).Gene(j) = [round(rand())];

    end
end

end