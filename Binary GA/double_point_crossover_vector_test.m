clc
clear

parent1 = [ round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())];
parent2 = [ round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())];

Gene_no = length(parent1)

%% Double point crossover using vectors

% Creating the first cross over point

ub = Gene_no-1;
lb = 1; 
cross_p1 = round( (ub-lb)*rand()+lb );

cross_p2 = cross_p1;

% Creating the second cross over point
% Such that they do not overlap

while cross_p2 == cross_p1

    ub = length(parent1)-1;
    lb = 1;
    cross_p2 = round( (ub-lb)*rand()+lb );

end

% Making the lower output cross_p1 and higher output cross_p2

if cross_p1 > cross_p2

    temp = cross_p1;
    cross_p1 = cross_p2;
    cross_p2 = temp;

end

cross_p1
cross_p2

%% Creating child1

C1P1 = parent1(1:cross_p1);
C1P2 = parent2(cross_p1+1 : cross_p2);
C1P3 = parent1(cross_p2+1 : end);

child1 = [C1P1, C1P2, C1P3]

%% Creating child2

C2P1 = parent2(1:cross_p1);
C2P2 = parent1(cross_p1+1 : cross_p2);
C2P3 = parent2(cross_p2+1 : end);

child2 = [C2P1, C2P2, C2P3]
