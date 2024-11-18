clc;
clear;
syms x

f1 = (x - 2).^2 + x .* log(x + 3);
f2 = exp(-2 * x) + (x - 2).^2;
f3 = exp(x) .* (x.^3 - 1) + (x - 1) .* sin(x);


% Δημιουργία διαγράμματος
figure;
fplot(f1, [-1, 3], 'red', 'LineWidth', 1.5); % Σχεδίαση f1 με κόκκινο
hold on;
fplot(f2, [-1, 3], 'blue', 'LineWidth', 1.5); % Σχεδίαση f2 με μπλε
fplot(f3, [-1, 3], 'green', 'LineWidth', 1.5); % Σχεδίαση f3 με πράσινο
hold off;

xlabel('x');
ylabel('f(x)');
title('Γραφικές παραστάσεις των f1(x), f2(x), και f3(x)');
legend('f1(x)', 'f2(x)', 'f3(x)');
grid on;

ylim([-5, 15]); 
