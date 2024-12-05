function [k] = newton_minimize(x1,y1,epsilon)
syms x y
f(x,y) = (x^5) * exp(-(x^2) - (y^2));
gradf = gradient(f, [x,y]);
d=0;

x_y(1,1)=x1;
x_y(2,1)=y1;
k = 1;
gamma=0;
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
    syms g
    min(g)= f((x_y(1,k)+g*d),(x_y(2,k)+g*d));
    [a(k), b(k)]= golden_algorithm(0,1,0.01,min);
    gamma(k)=(a(k)+b(k))/2;
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

function [a,b,k] = golden_algorithm(a1,b1,l,f)
gamma=0.618;
k=1;
a=a1;
b=b1;
x1 = a1+(1-gamma)*(b1-a1);
x2= a1+gamma*(b1-a1);
f1=f(x1);
f2=f(x2);

while (b-a>=l)
    if f1>f2
        a=x1;
        x1=x2;
        x2=a +gamma*(b-a);
        f1=f2;
        f2=f(x2);
    elseif (f1<f2)
        b=x2;
        x2=x1;
        x1=a +(1-gamma)*(b-a);
        f2=f1;
        f1=f(x1);
    else
        break;
    end
    k=k+1;
end
%disp(k);
%disp([a,b]);
return
end