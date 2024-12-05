function [k] = levenberg_const(x1,y1,epsilon)
syms x y
f(x,y) = (x^5) * exp(-(x^2) - (y^2));
gradf = gradient(f, [x,y]);
d=0;

x_y(1,1)=x1;
x_y(2,1)=y1;
k =1;
f_x_y = [];

while(norm(double(gradf(x_y(1,k),x_y(2,k)))) >= epsilon)
    mk=0;
    hessianf= hessian(f,[x,y]);
    h= double(subs(hessianf, [x,y] , [x_y(1,k), x_y(2,k)]));
    while any(eig(h + mk * eye(size(h))) <= 0)
    mk = mk + 1; 
    end
    d = -inv([hessianf(x_y(1,k),x_y(2,k))] + mk*eye(2)) * gradf(x_y(1,k),x_y(2,k));
    disp(mk);
    gamma(k)=0.8;
    disp(gamma(k));
    x_y(1,k+1)=x_y(1,k)+gamma(k)*d(1);
    x_y(2,k+1)=x_y(2,k)+gamma(k)*d(2);
    f_x_y(k) = double(f(x_y(1,k),x_y(2,k)));
    k=k+1;
    if k>100
      break;
    end
end

disp(x_y);
k=k+1;
disp(k);

figure(1);
plot(1:length(f_x_y),f_x_y,'LineWidth',2);
xlabel('Αριθμός επαναλήψεων k');
ylabel('f(x,y)');
title('Γραφική παράσταση της συνάρτησης f(x,y) ως προς τον αριθμό επαναλήψεων k για (xo,yo)');
grid on;

figure(2);
[X, Y] = meshgrid(-4:0.1:4, -4:0.1:4); 
f = (X.^5) .* exp(-(X.^2) - (Y.^2));   
contour(X, Y, f, 50,'LineWidth' , 1);  
xlabel('x');
ylabel('y');
title('Ισοβαρείς Καμπύλες της συνάρτησης f(x, y) για (xo,yo)');
hold on;
plot(x_y(1,:), x_y(2,:),'LineWidth',2,'Color', 'red');
scatter(x_y(1, :), x_y(2, :), 36,'filled','red');
grid on;
end