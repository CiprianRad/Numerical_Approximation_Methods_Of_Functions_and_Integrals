clear; clc;
x = -3:5;
x = -3:0.01:5;
x = linspace(-3, 5, 1000);

f = x.^2.*exp(x).*sin(x);
plot(x,f);

g = @(x) x^2+2*x-tan(x);
yo = g(1);

p = @(x) 2*x^3 - 5*x^2 + 8;
p(2);

%%

clear;clc;

p = [2,-5,0,8];
polyval(p,2)

roots(p)

interval = linspace(-10,10, 1000);
val_p = polyval(p, interval);
plot(interval, val_p)

grid on
axis square

%%

x = linspace(0,1,1000);
f = exp(10*x.*(x-1)).*sin(12*pi*x);
plot(x,f,'r')
hold on

g = 3*exp(5*x.^2-1).*cos(12*pi*x);
plot(x,g, 'b')
grid on 
axis square

hold off

%%

x = linspace(0,2*pi, 1000);
f1 = cos(x);
f2 = sin(x);
f3 = cos(2*x);
plot(x,f1,x,f2,x,f3)

%%

x = linspace(-4,4, 1000);
y = linspace(-4,4,1000);
f = @(x,y) exp(x.^2+y.^2);

[Xd,Yd] = meshgrid(x,y);
Z = f(Xd, Yd);
mesh(Xd,Yd,Z)
grid on

%%
clear;clc;

x = linspace(-2,2,1000);
y = linspace(-4,4,1000);
g = @(x,y) exp(-(x-1/2).^2+(y-1/2).^2);

[Xd, Yd] = meshgrid(x,y);
Z = g(Xd, Yd);
mesh(Xd, Yd, Z);
grid on

%%
clear;clc;
t = linspace(0,10*pi, 1000);
a = input('Dati o valoare pentru a');
b = input('Dati o valoare pentru b');
xt = (a+b)*cos(t) - b*cos((a/b+1)*t);
yt = (a+b)*(sin(t)) - b*sin((a/b+1)*t);

plot(xt, yt)
grid on
axis equal
plot3(t, xt, yt);

grid on

%%

clear;clc;

xpar = 0:2:50;
ximpar = 1:2:50;

f_par = xpar/2;
f_impar = 3*ximpar+1;

plot(xpar, f_par, 'ob');
hold on
plot(ximpar, f_impar, 'ob')
grid on
axis square
