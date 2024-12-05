function [x,k] = steepest_descent_const(x1_start,x2_start,gamma)
epsilon = 0.001;
syms x1 x2;
f =  (x1^2)/3 + 3*(x2^2) ;
grad = gradient(f, [x1,x2]); 
gradf=matlabFunction(grad,'Vars',[x1,x2]);
d=0;

x=[x1_start; x2_start];
k =1;
f_x1_x2=double(subs(f,[x1 x2],[x(1,k),x(2,k)]));
grad_f=gradf(x(1,k),x(2,k));

while(norm(grad_f) >= epsilon)
    d = -grad_f;
    x(:,k+1)=x(:,k)+gamma*d;
    %x(2,k+1)=x(2,k)+gammad(2);
    grad_f=gradf(x(1,k+1),x(2,k+1));
    f_x1_x2 = [f_x1_x2 double(subs(f,[x1 x2],[x(1,k+1),x(2,k+1)]))];
    k=k+1;
    if k>100
      break;
    end
end
disp(x);
disp(k);
disp(f_x1_x2);
figure(1);
plot(1:k,f_x1_x2,'LineWidth',2);
xlabel('Αριθμός επαναλήψεων k');
ylabel('f(x)');
title('Γραφική παράσταση της συνάρτησης f(x) ως προς τον αριθμό επαναλήψεων k για αρχικό σημείο εκκίνησης (1,1)');
grid on;

figure(2);
[X1, X2] = meshgrid(-4:0.2:4, -4:0.2:4); 
f = 1/3 * (X1.^2) + 3 * (X2.^2);
contour(X1, X2, f, 50,'LineWidth' , 1);
xlabel('x1');
ylabel('x2');
title('Ισοβαρείς Καμπύλες της συνάρτησης f(x) και διαδρομή σύγκλισης για αρχικό σημείο εκκίνησης (1,1)');
hold on;
plot(x(1,:), x(2,:),'LineWidth',2,'Color', 'r');
scatter(x(1, :), x(2, :), 25,'filled','red');
grid on;


end