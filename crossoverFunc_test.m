function [child1, child2] = crossoverFunc_test(parent1, parent2, Pc, crossover_type)

switch crossover_type
    case'single'

        Gene_no = length(parent1.Gene);

        %% Single point crossover using vectors

        ub = Gene_no-1;
        lb = 1;
        cross_single_point = round( (ub-lb)*rand()+lb );

        %% Creating child1

        C1P1 = parent1.Gene(1:cross_single_point);
        C1P2 = parent2.Gene(cross_single_point+1 : Gene_no);

        %% Creating child2

        C2P1 = parent2.Gene(1:cross_single_point);
        C2P2 = parent1.Gene(cross_single_point+1 : Gene_no);

        %% Printing the result

        child1.Gene = [C1P1, C1P2];
        child2.Gene = [C2P1, C2P2];


    case'double'

        Gene_no = length(parent1.Gene);

        %% Double point crossover using vectors

        % Creating the first cross over point

        ub = Gene_no-1;
        lb = 1;
        cross_p1 = round( (ub-lb)*rand()+lb );

        cross_p2 = cross_p1;

        % Creating the second cross over point
        % Such that they do not overlap

        while cross_p2 == cross_p1

            ub = Gene_no-1;
            lb = 1;
            cross_p2 = round( (ub-lb)*rand()+lb );

        end

        % Making the lower output cross_p1 and higher output cross_p2

        if cross_p1 > cross_p2

            temp = cross_p1;
            cross_p1 = cross_p2;
            cross_p2 = temp;

        end

        %% Creating child1

        C1P1 = parent1.Gene(1:cross_p1);
        C1P2 = parent2.Gene(cross_p1+1 : cross_p2);
        C1P3 = parent1.Gene(cross_p2+1 : end);

        child1.Gene = [C1P1, C1P2, C1P3];

        %% Creating child2

        C2P1 = parent2.Gene(1:cross_p1);
        C2P2 = parent1.Gene(cross_p1+1 : cross_p2);
        C2P3 = parent2.Gene(cross_p2+1 : end);

        child2.Gene = [C2P1, C2P2, C2P3];

end

%% For child1
 
R1 =rand();

if R1 <= Pc
    child1 = child1;
else
    %disp('child1 = parent1')
    child1 = parent1;

end

%% For child2
 
R2 =rand();

if R2 <= Pc
    child2 = child2;
else
    %disp('child2 = parent2')
    child2 = parent2;

end

end