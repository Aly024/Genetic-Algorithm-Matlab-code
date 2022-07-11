clear
clc
hold on
close all

%% Controlling parameters of CGA

problem.objFunc = @Sphere;
problem.nVar = 2;
problem.ub = ones(1,problem.nVar) * 100;
problem.lb = ones(1,problem.nVar) * -100;

M = 20; % population
N = problem.nVar; % number of genes (variables)
MaxGen = 100; 
Pc = 0.95;
Pm = 0.1;
Er = 0.4;

[Best_Chrom] = CGA_Func(M,N,MaxGen, Pc, Pm, Er, problem);

Best_Chrom.Gene;
Best_Chrom.fitness;