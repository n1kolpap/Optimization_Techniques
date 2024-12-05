function [x , k] = p_steepest_descent(x1_start,x2_start,gamma,sk)
epsilon = 0.01;

syms x1 x2;
f =  (x1^2)/3 + 3*(x2^2) ;
grad = gradient(f, [x1,x2]); 
gradf = matlabFunction(grad,'Vars',[x1,x2]);

d=0;
x=[x1_start; x2_start];
k =1;
f_x1_x2=double(subs(f,[x1 x2],[x(1,k),x(2,k)]));
grad_f=gradf(x(1,k),x(2,k));

while(norm(grad_f) >= epsilon)
    grad_f=gradf(x(1,k),x(2,k));
    d = -grad_f;

    %Projection

    a=x(1,k) + sk*d(1);
    b=x(2,k) + sk*d(2);

    if(a <= 5 && a >= -10)
        xbar1=a;
    elseif (a < -10)
        xbar1 = -10;
    elseif (a > 5)
        xbar1 = 5;
    end

    if (b <= 12 && b >= -8)
        xbar2 = b;
    elseif (b < -8)
        xbar2 = -8;
    elseif (b > 12)
        xbar2 = 12;
    end

    x(1,k+1) = x(1,k) + gamma*(xbar1- x(1,k));
    x(2,k+1) = x(2,k) + gamma*(xbar2-x(2,k));

    k=k+1;
    if k>2000
      break;
    end
end
disp(x);
f_x = zeros(1,k);
for i=1:k
    f_x(i)=double(subs(f,[x1 x2],[x(1,i),x(2,i)]));
end

figure(1);
plot(1:k,f_x,'*-','LineWidth',0.5);
xlabel('Αριθμός επαναλήψεων k');
ylabel('f(x)');
title('Γραφική παράσταση της συνάρτησης f(x) ως προς τον αριθμό επαναλήψεων k για αρχικό σημείο εκκίνησης (x1,x2)');
grid on;

figure(2);
[X1, X2] = meshgrid(-15:0.2:15, -15:0.2:15); 
f = 1/3 * (X1.^2) + 3 * (X2.^2);
contour(X1, X2, f, 50,'LineWidth' , 1);
xlabel('x1');
ylabel('x2');
title('Ισοβαρείς Καμπύλες της συνάρτησης f(x) και διαδρομή σύγκλισης');
hold on;
plot(x(1,:), x(2,:),'LineWidth',2,'Color', 'r');
scatter(x(1, :), x(2, :), 40,'filled','red');
rectangle('Position', [-10, -8, 15, 20], 'EdgeColor', 'r',"LineWidth",1,"LineStyle","--");
grid on;

end