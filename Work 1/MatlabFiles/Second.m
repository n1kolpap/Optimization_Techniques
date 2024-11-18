clc
clear 
close all 

 
colors = {'r','b','g','black'};

syms x;
f(x)= (x-2)^2 + x*log(x+3); %κάθε φορά τρέχω με τη κάθε συνάρτηση για το plot που θέλω
%f(x)= exp((-2*x)) + (x-2)^2;
%f(x)= exp(x)*(x^3 - 1)+(x-1)*sin(x);


l_values = [0.0025, 0.01, 0.02, 0.1];

figure;
for i=1:length(l_values)
    l=l_values(i);
    [ak,bk,k_values]=golden_algorithm(-1,3,l,f,colors{i});
    hold on
    grid on
    plot(k_values,ak,'Color',colors{i},'LineWidth', 1.8,'DisplayName', ['a_k for l = ' num2str(l)]);
    plot(k_values,bk,'Color',colors{i},'LineWidth', 1.8,'LineStyle', '--','DisplayName', ['b_k for l = ' num2str(l)]);
    xlabel('k'); 
    ylabel('[ak bk]');
    legend;
    title('f1(x) για διάφορες τιμές του τελικού εύρους αναζήτησης l');

end
function [ak,bk,k_values] = golden_algorithm(a1,b1,l,f,colors)
gamma=0.618;
k=1;
ak=[];
bk=[];
k_values=[];
a=a1;
b=b1;
x1 = a1+(1-gamma)*(b1-a1);
x2= a1+gamma*(b1-a1);
f1=f(x1);
f2=f(x2);

while (b-a>=l)
    ak=[ak,a];
    bk=[bk,b];
    k_values=[k_values,k];
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
    end
    k=k+1;
end
ak=[ak,a];
bk=[bk,b];
k_values=[k_values,k];
%disp(k);
%disp([a,b]);
%return
end