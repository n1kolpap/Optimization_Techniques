close all;
clc;
clear;

syms x1 x2
f(x1,x2) =  (x1^2)/3 + 3*(x2^2) ;

% figure(1);
% grid on;
% fsurf(f,'ShowContours', 'on');
% xlabel('x1');
% ylabel('x2');
% zlabel('f(x1,x2)');
% box on;
% title('Plot of f(x)');

% figure(2);
% fcontour(f);
% grid on;
% xlabel('x');
% ylabel('y');
% title('Contour lines of f(x)');

% Θέμα 1ο

%[x,k1] = steepest_descent_const(1,1,0.1);
%[x,k2] = steepest_descent_const(1,1,0.3);
%[x,k3] = steepest_descent_const(1,1,3);
%[x,k4] = steepest_descent_const(1,1,5);


% Θέμα 2ο

%[x, k] = p_steepest_descent(5,-5,0.5,5);

% Θέμα 3ο
%[x, k] = p_steepest_descent(-5,10,0.1,15);
%[x, k] = p_steepest_descent(-5,10,0.1,1.66);

% Θέμα 4ο

[x, k] = p_steepest_descent(8,-10,0.2,0.1);
