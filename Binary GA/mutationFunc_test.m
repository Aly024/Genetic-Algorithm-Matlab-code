function [child] = mutationFunc_test(child, Pm);


Gene_no = length(child.Gene);

for k = 1: Gene_no

    R = rand();

    if R < Pm
        k;
        child.Gene;
        child.Gene(k) =~ child.Gene(k);
    end


end