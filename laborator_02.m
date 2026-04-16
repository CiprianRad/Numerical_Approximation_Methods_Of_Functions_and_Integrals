clear; clc;
x = linspace(0,1,1000);
l1 = x;
l2 = 3/2*x.^2-1/2;
l3 = 5/2*x.^3-3/2*x;
l4 = 35/8*x.^4 - 15/4*x.^2+3/8;

subplot(2,2,1)
plot(x, l1)
subplot(2,2,2)
plot(x, l2)
subplot(2,2,3)
plot(x, l3)
subplot(2,2,4)
plot(x, l4)

%%

clear;clc;

t = linspace(-1,1, 1000)
T1 = cos(1*acos(t));
T2 = cos(2*acos(t));
T3 = cos(3*acos(t));

plot(t, T1)
hold on
plot(t, T2)
plot(t, T3)
grid on
axis square

figure
T = @(t,n) cos(n*acos(t));
plot(t, T(t,1), t, T(t,2), t, T(t,3))
grid on 
axis square

%%
n = input('Dati o valoare pentru n');
x = linspace(-1,1, 1000);
T0 = 1;
T1 = x;
plot(x, T0, x, T1)
hold on
grid on
axis equal
for i = 1:n
    T2 = 2*x.*T1 - T0;
    plot(x,T2)
    hold on
    grid on
    axis square
    T0 = T1;
    T1 = T2;
end

%%

x = linspace(-1, 3, 1000);

P0 = 1;
plot(x, P0)
hold on
grid on
axis equal

for i = 1 : 6
    P1 = P0 + (x.^i/factorial(i));
    plot(x,P1)
    hold on
    grid on
    axis square
    P0 = P1;
end

%%
clear;clc;

i = 0:1:6;
h = 0.25;
x = zeros(1, length(i));

%Sau asa:
% for k = 1 : 7
%     x(k) = 1 + (k-1)*h;
% end

x = 1 + i * h;

f = sqrt (5*x.^2 + 1);

A = zeros(length(x));
A(:, 1) = f';

n = length(x);

for j = 2 : n
    for i = 1 : n - j + 1
        A(i, j) = A (i+1, j-1) - A(i, j-1)
    end
end

%%
clear;clc;

x0 = 2;
x1 = 4;
x2 = 6;
x3 = 8;
f0 = 4;
f1 = 8;
f2 = 14;
f3 = 16;

A = zeros(4);
A(1,1) = x0; 
A(2,1) = x1;
A(3,1) = x2;
A(4,1) = x3;

A(1,2) = f0; 
A(2,2) = f1;
A(3,2) = f2;
A(4,2) = f3;

for j = 3 : 4
    for i = 1 : 4 - j + 1
        A(i,j) = (A(i+1,j-1) - A(i,j-1))/(A(j,1) - A(i,1))
    end
end

%%

x = 2:2:8;
f = [4,8,14,16];
n = length(x);
A = zeros(n);

A(:,1) = f';

for j = 2 : n
    for i = 1 : n - j + 1
        A(i,j) = (A(i+1, j-1) - A(i, j-1))/(x(i+j-1) - x(i));
    end
end
