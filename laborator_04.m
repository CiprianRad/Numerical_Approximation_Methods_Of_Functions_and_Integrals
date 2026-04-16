clear; clc;

function Nx = Newton_poly(xk, fk, x)

    n = length(xk);
    A = zeros(n);
    A(:,1) = fk;

    for j = 2 : n
        for i = 1 : n - j + 1
            A(i,j) = (A(i+1, j-1) - A(i, j-1))/(xk(i+j-1) - xk(i));
        end
    end

    first_line = A(1,:);
    
    m = length(x);
    Nx = zeros(size(x));

    for k = 1 : m
        sum_value = first_line(1);
        
        for j = 2 : n

            product_value = 1;
            
            for i = 1 : (j-1)
                product_value = product_value * (x(k) - xk(i));
            end

            sum_value = sum_value + first_line(j) * product_value;
        end
        Nx(k) = sum_value;
    end
end

xk = [1, 1.5, 2, 3, 4];
fk = [0, 0.17609, 0.30103, 0.47712, 0.60206];

x = [2.5, 3.25];

logarim_approximation = Newton_poly(xk, fk, x);

fprintf('Estimated value in %g: %.5f\n', x(1), logarim_approximation(1));
fprintf('Estimated value in %g: %.5f\n', x(2), logarim_approximation(2));

i = 10:35;
y = i/10;

exact_function = log10(y);

approximate_function = Newton_poly(xk,fk, y);

error = abs(exact_function(:) - approximate_function(:));

maximal_error = max(error(:));

fprintf('Maximal interpolation error is: %.8f\n', maximal_error);




x_fert = [1, 2, 3, 4, 5];
y_cart = [22, 23, 25, 30, 28];
x_target = 2.5;

y_approx = Newton_poly(x_fert, y_cart, x_target);

fprintf('Productia estimata pentru %g kg de fertilizator este: %.2f kg de cartofi\n', x_target, y_approx);

x_plot = linspace(1, 5, 100); 

y_plot = Newton_poly(x_fert, y_cart, x_plot);

figure(1);

plot(x_fert, y_cart); 
hold on;

plot(x_plot, y_plot); 
hold off;

grid on;



f = @(x) exp(sin(x));

x_nodes = linspace(0,6,13);
f_nodes = f(x_nodes);


x_plot = linspace(0, 6, 500);
f_exact_plot = f(x_plot);

f_approx_plot = Newton_poly(x_nodes, f_nodes, x_plot);

figure(2);

plot(x_nodes, f_nodes);

hold on;

plot(x_plot, f_exact_plot);
plot(x_plot, f_approx_plot);

hold off;
grid on;



x_val = 115;
eps = 0.001;


X = [121, 100, 144, 81, 64, 169]; 
F = [11,  10,  12,  9,  8,  13];

n = length(X);
A = zeros(n, n);
A(:,1) = F';

found = false;

for i = 2:n
    for j = 2:i
        
        term1 = A(j-1, j-1) * (X(i) - x_val);
        term2 = A(i, j-1) * (X(j-1) - x_val);
        
        A(i,j) = (term1 - term2) / (X(i) - X(j-1));
    end
    
    eroare = abs(A(i,i) - A(i-1, i-1));
    if eroare <= eps
        fprintf('\n Precision eps = %g has been found at iteration %d.\n', eps, i-1);
        fprintf(' estimated value for sqrt(115) is: %.5f\n', A(i,i));
        found = true;
        break;
    end
end

if ~found
    fprintf('\n Precision not yet close enough. Add more nodes.\n');
end

function Q = Neville_algo(X, F, x_target)
    n = length(X);
    Q = zeros(n, n);
    
    Q(:, 1) = F(:); 
    
    for j = 2:n
        for i = j:n
            
            termen1 = (x_target - X(i-j+1)) * Q(i, j-1);
            termen2 = (x_target - X(i)) * Q(i-1, j-1);
            
            Q(i, j) = (termen1 - termen2) / (X(i) - X(i-j+1));
        end
    end
end

valoare_exacta = sqrt(3);

x_nodes_a = [-2, -1, 0, 1, 2];
f_nodes_a = 3 .^ x_nodes_a;
x_target_a = 0.5;

Q_a = Neville_algo(x_nodes_a, f_nodes_a, x_target_a);

aprox_a = Q_a(end, end);

fprintf('Aproximarea pentru sqrt(3) la x = 0.5 este: %.6f\n', aprox_a);
fprintf('Eroarea absoluta: %e\n\n', abs(valoare_exacta - aprox_a));

x_nodes_b = [0, 1, 2, 4, 5];
f_nodes_b = sqrt(x_nodes_b);
x_target_b = 3; 

Q_b = Neville_algo(x_nodes_b, f_nodes_b, x_target_b);
aprox_b = Q_b(end, end);

fprintf('Aproximarea pentru sqrt(3) la x = 3 este: %.6f\n', aprox_b);
fprintf('Eroarea absoluta: %e\n\n', abs(valoare_exacta - aprox_b));