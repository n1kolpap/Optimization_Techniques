clc
clear 
close all 

 
colors = {'r','b','g','black'};

syms x;
%f(x)= (x-2)^2 + x*log(x+3);
%f(x)= exp((-2*x)) + (x-2)^2;
f(x)= exp(x)*(x^3 - 1)+(x-1)*sin(x);


l_values = [0.001, 0.0025, 0.005, 0.01];

figure;
for i=1:length(l_values)
    l=l_values(i);
    [ak,bk,k_values]=fibonacci_algorithm(-1,3,0.001,l,f,colors{i});
    hold on
    grid on
    plot(k_values,ak,'Color',colors{i},'LineWidth', 1.8,'DisplayName', ['a_k for l = ' num2str(l)]);
    plot(k_values,bk,'Color',colors{i},'LineWidth', 1.8,'LineStyle', '--','DisplayName', ['b_k for l = ' num2str(l)]);
    xlabel('k'); 
    ylabel('[ak bk]');
    legend;
    title('f3(x) για διάφορες τιμές του τελικού εύρους αναζήτησης l');

end
function [ak,bk,k_values] = fibonacci_algorithm(a1,b1,epsilon,l,f,colors)
a=a1;
b=b1;
n=0;
ak=[];
bk=[];
k_values=[];

while fibonacci(n) <= ((b-a)/l) 
    n = n+1;
end

disp(n-1);

fib=zeros(1,n+1); %αποθήκευση αριθμών fibonacci
for i= 1 : n+1
    fib(i) = fibonacci(i-1);
end
    x1 = a + (fib(n-1)/fib(n+1))*(b-a);
    x2 = a + (fib(n)/fib(n+1))*(b-a);
    f1 = f(x1);
    f2 = f(x2);
    k=1;
    ak=[ak,a];
    bk=[bk,b];
    k_values=[k_values,k];

for j= 1 : (n-2)
    if (f1>f2)
        a=x1;
        x1=x2;
        x2= a + (fib(n-k)/fib(n-k+1))*(b-a);
        if (k == (n-2))
            x1n = x1;
            x2n = x1 + epsilon;
            if (f(x1n) > f(x2n))
                a=x1n;
            else
                b=x2n;
            end
            ak=[ak,a];
            bk=[bk,b];
            k_values=[k_values,k];
            return
        else
            f1 = f2;
            f2 = f(x2);
            k = k+1;
        end
    elseif (f1<f2)
        b = x2;
        x2 = x1;
        x1= a + ((fib(n-k-1)/fib(n-k+1))*(b-a));
        if k == (n-2)
            x1n = x1;
            x2n = x1 + epsilon;
            if (fx1n) > f(x2n)
                a=x1n;
            else
                b=x2n;
            end
            ak=[ak,a];
            bk=[bk,b];
            k_values=[k_values,k];
            return
        else
            f2 = f1;
            f1 = f(x1);
            k = k+1;
        end
    end
    ak=[ak,a];
    bk=[bk,b];
    k_values=[k_values,k];
end
% ak=[ak,a];
% bk=[bk,b];
% k_values=[k_values,k];
%disp([a b]);
end