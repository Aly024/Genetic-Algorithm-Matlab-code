function [fitness_values] = fitnessFunc(X)

    no_blades = X(1);
    lenght_blades = X(2);
    fitness_values = 12.3*(no_blades + lenght_blades);

end