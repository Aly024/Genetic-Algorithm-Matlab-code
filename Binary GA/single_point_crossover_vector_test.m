clc
clear

parent1 = [ round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())];
parent2 = [ round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())];

Gene_no = length(parent1)

%% Single point crossover using vectors

ub = Gene_no-1;
lb = 1; 
cross_single_point = round( (ub-lb)*rand()+lb )

%% Creating child1 

C1P1 = parent1(1:cross_single_point);
C1P2 = parent2(cross_single_point+1 : Gene_no);

%% Creating child2

C2P1 = parent2(1:cross_single_point);
C2P2 = parent1(cross_single_point+1 : Gene_no);

%% Printing the result

child1 = [C1P1, C1P2]
child2 = [C2P1, C2P2]
