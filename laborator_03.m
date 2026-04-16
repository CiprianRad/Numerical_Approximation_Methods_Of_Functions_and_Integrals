clear;
clc;

function Lx = bary_Lagrange(xk, fk, x)
    n = length(xk);
    m = length(x);
    Lx = zeros(1,m);
    
    for j = 1 : n

        product_value = 1;
        
        for k = 1 : n
            if k ~= j
                product_value = product_value * (xk(j) - xk(k));
            end
        end
        w(j) = 1 / product_value;
    end

    for i = 1 : m
        is_node = false;
        for j = 1 : n

            if x(i) == xk(j)
                Lx(i) = fk(j);
                is_node = true;
            end
        end
        
        if is_node == false
            numerator = 0;
            denumerator = 0;

            for j = 1 : n
                sum_term = w(j) / (x(i) - xk(j));

                numerator = numerator + sum_term * fk(j);
                denumerator = denumerator + sum_term;
            end
            Lx(i) = numerator / denumerator;
        end
    end
end

xk = [1930, 1940, 1950, 1960, 1970, 1980];
fk = [123203, 131669, 150697, 179323, 203212, 226505];

x = [1955, 1995];

estimated_population = bary_Lagrange(xk, fk, x);
fprintf('Estimated population in %d: %.2f\n', x(1), estimated_population(1));
fprintf('Estimated population in %d: %.2f\n', x(2), estimated_population(2));




noduri_radical = [196, 225, 256];
valori_radical = [14, 15, 16];
x = 235;

estimated_radical_value = bary_Lagrange (noduri_radical, valori_radical, x)



f = @(x) (1 + cos(pi * x)) ./ (1 + x);

node_values = linspace(0, 10, 21);

function_values = f(node_values);

x_for_plot = linspace(0, 10, 1000);

actual_function = f(x_for_plot);
approximation = bary_Lagrange(node_values, function_values, x_for_plot);

figure
plot(x_for_plot, actual_function, x_for_plot, approximation)




f = @(x) 1 ./ (1 + x.^2);

i_eval = 0:100;
yi = (i_eval / 10) - 5;

f_yi = f(yi);

n_values = [2, 4, 6, 8];

figure;

for k = 1:length(n_values)
    n = n_values(k);

    i_nodes = 0:n;
    xi = i_nodes * (10 / n) - 5;

    fi = f(xi);

    Pn_yi = bary_Lagrange(xi, fi, yi);

    En = max(abs(f_yi - Pn_yi));

    fprintf('For n = %d, the maximum error En is: %.6f\n', n, En);

    subplot(2, 2, k);
    plot(yi, f_yi, yi, Pn_yi);
    title(sprintf('n = %d', n));
end


% f = @(x) 1 ./ (1 + x.^2);

% i_eval = 0:100;
% yi = (i_eval / 10) - 5;
% f_yi = f(yi);
% 
% i = 0:20;
% 
% x1 = 5 * cos(i * pi / 20);
% f1 = f(x1);
% 
% x2 = 5 * cos((2 * i + 1) * pi / 42);
% f2 = f(x2);
% 
% P1_yi = bary_Lagrange(x1, f1, yi);
% P2_yi = bary_Lagrange(x2, f2, yi);
% 
% E1 = max(abs(f_yi - P1_yi));
% E2 = max(abs(f_yi - P2_yi));
% 
% fprintf('Error for Set 1: %f\n', E1);
% fprintf('Error for Set 2: %f\n', E2);
% 
% figure;
% 
% subplot(1, 2, 1);
% plot(yi, f_yi, yi, P1_yi);
% title('First formula');
% 
% subplot(1, 2, 2);
% plot(yi, f_yi, yi, P2_yi);
% title('Second formula');

f = @(x) 1 ./ (1 + x.^2);

i_eval = 0:100;
yi = (i_eval / 10) - 5;
f_yi = f(yi);

n_values = [2, 4, 6, 8];

figure(1); 
figure(2); 

fprintf('\n');
fprintf('Maximum Errors for Chebyshev nodes \n');

for k = 1:length(n_values)
    n = n_values(k);
    i = 0:n;
   
    x1 = 5 * cos(i * pi / n);
    x2 = 5 * cos((2 * i + 1) * pi / (2 * n + 2));
    
    f1 = f(x1);
    f2 = f(x2); 
   
    P1_yi = bary_Lagrange(x1, f1, yi);
    P2_yi = bary_Lagrange(x2, f2, yi);
   
    E1 = max(abs(f_yi - P1_yi));
    E2 = max(abs(f_yi - P2_yi));
    
    fprintf('n = %d | Error Set 1: %f | Error Set 2: %f\n', n, E1, E2);
    
    figure(3);
    subplot(2, 2, k);
    plot(yi, f_yi, yi, P1_yi);
    title(sprintf('Set 1: n = %d', n));
    
    figure(4);
    subplot(2, 2, k);
    plot(yi, f_yi, yi, P2_yi);
    title(sprintf('Set 2: n = %d', n));
end