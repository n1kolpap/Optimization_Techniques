clc
clear 
close all 

 
colors = {'r','b','g','black'};

syms x;
%f(x)= (x-2)^2 + x*log(x+3);
%f(x)= exp((-2*x)) + (x-2)^2;
f(x)= exp(x)*(x^3 - 1)+(x-1)*sin(x);


l_values = [0.001, 0.005, 0.01, 0.02];

figure;
for i=1:length(l_values)
    l=l_values(i);
    [ak,bk,k_values]=bisector_algorithm_df(-1,3,l,f,colors{i});
    hold on
    grid on
    plot(k_values,ak,'Color',colors{i},'LineWidth', 1.8,'DisplayName', ['a_k for l = ' num2str(l)]);
    plot(k_values,bk,'Color',colors{i},'LineWidth', 1.8,'LineStyle', '--','DisplayName', ['b_k for l = ' num2str(l)]);
    xlabel('k'); 
    ylabel('[ak bk]');
    legend;
    title('f3(x) για διάφορες τιμές του τελικού εύρους αναζήτησης l');

end
function [ak,bk,k_values]= bisector_algorithm_df(a1,b1,l,f,colors)
syms x;
a=a1; b=b1;
ak=[]; bk=[];
k_values=[];
lamda=l/(b1-a1);
ni=log(lamda)/log(1/2);
n=ceil(ni);
k=1;
disp(n);
df=diff(f,x);
Df=matlabFunction(df);
while k<=n
    ak=[ak,a];
    bk=[bk,b];
    k_values=[k_values,k];
    xk=(a+b)/2;
    Dfk=Df(xk);
    if (Dfk == 0)
        disp(xk);
        disp([-1,-1]);
        return
    elseif (Dfk>0)
        b=xk;
    else 
        a=xk;
    end
    if k==n
        disp([a b]);
        return
    else
        k=k+1;
    end
    ak=[ak,a];
    bk=[bk,b];
    k_values=[k_values,k];
end
%disp(k);
end