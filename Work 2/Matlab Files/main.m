close all
clc
clear

syms f(x,y);
f(x,y) = (x^5) * exp(-(x^2) - (y^2));


% Ερώτημα 1ο : Σχεδίαση της f

% figure(1);
% grid on;
% fsurf(f,'ShowContours', 'on');
% xlabel('x');
% ylabel('y');
% zlabel('f(x,y)');
% box on;
% title('Plot of f(x,y)');
% 
% figure(2);
% fcontour(f);
% grid on;
% xlabel('x');
% ylabel('y');
% title('Contour lines of f(x,y)');

% Ερώτημα 2ο : Steepest Descent Method

% γκ σταθερό
%steepest_descent_const(0,0,0.0001);
%steepest_descent_const(-1,1,0.0001);
%steepest_descent_const(1,-1,0.0001);

% γκ minimize
%steepest_descent_minimize(0,0,0.0001);
%steepest_descent_minimize(-1,1,0.0001);
%steepest_descent_minimize(1,-1,0.0001);

%γκ armijo
%steepest_descent_armijo(0,0,0.0001);
%steepest_descent_armijo(-1,1,0.0001);
%steepest_descent_armijo(1,-1,0.0001);


% Ερώτημα 3ο : Newton Method

% γκ σταθερό
%newton_const(0,0,0.0001);
%newton_const(-1,1,0.0001);
%newton_const(1,-1,0.0001);

% γκ minimize
%newton_minimize(0,0,0.0001);
%newton_minimize(-1,1,0.0001);
%newton_minimize(1,-1,0.0001);

%γκ armijo
%newton_armijo(0,0,0.0001);
%newton_armijo(-1,1,0.0001);
%newton_armijo(1,-1,0.0001);

% Ερώτημα 4ο : Levenberg-Marquardt Method

% γκ σταθερο
%levenberg_const(0,0,0.0001);
%levenberg_const(-1,1,0.0001);
%levenberg_const(1,-1,0.0001);

% γκ minimize
%levenberg_minimize(0,0,0.0001);
%levenberg_minimize(-1,1,0.0001);
%levenberg_minimize(1,-1,0.0001);

% γκ armijo
%levenberg_armijo(0,0,0.0001);
%levenberg_armijo(-1,1,0.0001);
levenberg_armijo(1,-1,0.0001);



