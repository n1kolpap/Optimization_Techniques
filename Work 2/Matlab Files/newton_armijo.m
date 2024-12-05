function [k] = newton_armijo(x1,y1,epsilon)
syms x y
f(x,y) = (x^5) * exp(-(x^2) - (y^2));
gradf = gradient(f, [x,y]);
d=[];

x_y(1,1)=x1;
x_y(2,1)=y1;
k =1;
f_x_y = [];

while(norm(double(gradf(x_y(1,k),x_y(2,k)))) >= epsilon)
    hessianf= hessian(f,[x,y]);
    h= double(subs(hessianf, [x,y] , [x_y(1,k), x_y(2,k)]));
    if (all(eig(h)>0))
    d = -inv([hessianf(x_y(1,k),x_y(2,k))]) * gradf(x_y(1,k),x_y(2,k));
    else
        disp('Δεν ορίζεται ο Εσσιανός');
        disp(double(h));
        break;
    end
    a=10^(-4); % α ∈ [10^(-5) , 10^(-1)]
    b=10^(-1); % β ∈ [1/10 , 1/2]
    m=0; %ο μικρότερος μη-αρνητικός ακέραιος που ικανοποιεί το κριτήριο 4
    s=0.6; %αρχικό βήμα 

    while f(x_y(1,k),x_y(2,k))-f(x_y(1,k)+s*(b^m)*d(1),x_y(2,k)+s*(b^m)*d(2)) < -a*(b^(m)*s*d'*gradf(x_y(1,k),x_y(2,k)))
        m = m + 1;
    end
    gamma= s * b^(m);
    disp(gamma);
    x_y(1,k+1)=x_y(1,k)+gamma*(d(1))';
    x_y(2,k+1)=x_y(2,k)+gamma*(d(2))';
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

