clc
clear

parent1 = [ round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())];
parent2 = [ round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand())];

Gene_no = length(parent1)

%% Single point crossover using for loops
ub = Gene_no-1;
lb = 1; 
cross_single_point = round( (ub-lb)*rand()+lb )


%% Creating child1 and child2

for i = 1:cross_single_point

    child1(i) = parent1(i);
    child2(i) = parent2(i);

end

for i = cross_single_point + 1 : Gene_no

    child1(i) = parent2(i);
    child2(i) = parent1(i);

end



child1
child2
