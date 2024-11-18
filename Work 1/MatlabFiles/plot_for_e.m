function plot_for_e(f)  %σταθερό το τελικό εύρος αναζήτησης 𝑙 = 0.01 για τη μέθοδο της διχοτόμου
 epsilon_values=0.0001:0.00005:0.0049;
 n=zeros(size(epsilon_values));
for i = 1:length(epsilon_values)
    epsilon = epsilon_values(i);
    [a, b, n(i)] = bisector_algorithm(f, -1, 3, epsilon, 0.01);
    i=i+1;
end
figure;
plot(epsilon_values,2*n,'blue','LineWidth',1.4);
xlabel('ε');
ylabel('The number of times the algorithm gets to calculate an f value');
title('Calculations of the function f1(x) (l=0.01)');
% figure;
% plot(epsilon_values,n,'red','LineWidth',1.4);
% xlabel('ε');
% ylabel('The number of times the algorithm gets to calculate an f value');
% title('Calculations of the function f2(x) (l=0.01)');
% figure;
% plot(epsilon_values,n,'green','LineWidth',1.4);
% xlabel('ε');
% ylabel('The number of times the algorithm gets to calculate an f value');
% title('Calculations of the function f3(x) (l=0.01)');
end