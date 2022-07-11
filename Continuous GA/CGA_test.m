parent_1.Gene = [-2.5, -10.0];
parent_2.Gene = [0.0, 5.0];

ub = [10, 20];
lb = [-10, -20];

%figure;
box on
hold on
Pm = 0.1

for k = 1 : 500
    beta1 = rand();
    child_1.Gene(1) = [beta1*parent_1.Gene(1) + (1-beta1)*parent_2.Gene(1)];
    child_2.Gene(1) = [(1-beta1)*parent_1.Gene(1) + beta1*parent_2.Gene(1)];

    beta2 = rand();
    child_1.Gene(2) = [beta2*parent_1.Gene(2) + (1-beta2)*parent_2.Gene(2)];
    child_2.Gene(2) = [(1-beta2)*parent_1.Gene(2) + beta2*parent_2.Gene(2)];

    %% Draw Children
    h1 = plot(child_1.Gene(1), child_1.Gene(2),'.','color',[112,173,71]/255);
    h2 = plot(child_2.Gene(1), child_2.Gene(2),'.','color',[255,192,0]/255);
    set(h1,'MarkerSize',20);
    set(h2,'MarkerSize',20);

    R1 = rand();
    if R1<Pm
        Child_1.Gene(1) = (ub(1)-lb(1))*rand() + lb(1);
        Child_2.Gene(1) = (ub(1)-lb(1))*rand() + lb(1);
        h3 = plot(Child_1.Gene(1),Child_2.Gene(1),'.','color','r');
        set(h3, 'MarkerSize',20);
    end


    R2 = rand();
    if R2<Pm
        Child_1.Gene(2) = (ub(2)-lb(2))*rand() + lb(2);
        Child_2.Gene(2) = (ub(2)-lb(2))*rand() + lb(2);
        h4 = plot(Child_1.Gene(2),Child_2.Gene(2),'.','color','b');
        set(h4, 'MarkerSize',20);
    end


    

    %%Draw Parents

    h5 = plot(parent_1.Gene(1),parent_1.Gene(2),'o','color',[42 75 133]/255);
    h6 = plot(parent_2.Gene(1),parent_2.Gene(2),'o','color',[204 0 102]/255);
    set(h5, 'MarkerSize',14,'MarkerFaceColor', [42 75 133]/255);
    set(h6, 'MarkerSize',14,'MarkerFaceColor', [204 0 102]/255);
    pause(0.01);

end