function plot_for_l(f,algorithm)

l_values=0.0021:0.00005:0.01;

n=zeros(size(l_values));

for i = 1:length(l_values)
    l = l_values(i);
    if algorithm==1 %bisector_algorithm-μέθοδο διχοτόμου
        [a, b, n(i)] = bisector_algorithm(f, -1, 3, 0.001, l);
    elseif algorithm==2 %golden_algorithm-μέθοδο χρυσού τομέα
        [a, b, n(i)] = golden_algorithm(-1, 3,l,f);
    elseif algorithm==3 %fibonacci_algorithm-μέθοδο Fibonacci
        [a, b, n(i)] = fibonacci_algorithm(-1, 3, 0.001, l,f);
    elseif algorithm==4 %bisector_algorithm_with_df-μέθοδο διχοτόμου με παραγώγους
        [a,b ,n(i)] = bisector_algorithm_df(-1, 3,l,f);
    end
    i=i+1;
end
figure;
plot(l_values,n,'blue','LineWidth',1.4); %για τον bisector_algorithm το n = 2*n
xlabel('l');
ylabel('The number of times the algorithm gets to calculate an f value');
title('Calculations of the function f1(x) (ε=0.001)');

% figure;
% plot(l_values,n,'red','LineWidth',1.4);
% xlabel('l');
% ylabel('The number of times the algorithm gets to calculate an f value');
% title('Calculations of the function f2(x) (ε=0.001)');
% figure;
% plot(l_values,n,'green','LineWidth',1.4);
% xlabel('l');
% ylabel('The number of times the algorithm gets to calculate an f value');
% title('Calculations of the function f2(x) (ε=0.001)');