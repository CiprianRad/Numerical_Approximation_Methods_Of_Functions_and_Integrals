clear; clc;

function Hx = Hermite_poly(xk, fk, dfk, x)
    n = length(xk);
    N = 2 * n;
    
    z = zeros(N, 1);
    fz = zeros(N, 1);
    for i = 1:n
        z(2*i-1) = xk(i);
        z(2*i)   = xk(i);
        fz(2*i-1) = fk(i);
        fz(2*i)   = fk(i);
    end

    A = zeros(N, N);
    A(:,1) = fz;

    for j = 2:N
        for i = 1 : (N - j + 1)
            if j == 2 && z(i) == z(i+1)
                A(i,j) = dfk(ceil(i/2));
            else
                A(i,j) = (A(i+1, j-1) - A(i, j-1)) / (z(i+j-1) - z(i));
            end
        end
    end

    coeff = A(1,:);
    m = length(x);
    Hx = zeros(size(x));

    for k = 1:m
        val = coeff(1);
        product_term = 1;
        for j = 2:N
            product_term = product_term * (x(k) - z(j-1));
            val = val + coeff(j) * product_term;
        end
        Hx(k) = val;
    end
end

x_time = [0,3,5,8,13];
f_distance = [0,225,383,623,993];
f_speed = [75, 77, 80,74, 72];

Hermite_poly(x_time, f_distance, f_speed, 10);

fprintf('Estimated distance is %g: %.5f\n', Hermite_poly(x_time, f_distance, f_speed, 10));



x_values = [1,2];
f_values = [0,0.6931];
df_values = [1, 0.5];

actual_value = log(1.5);
approximate_value = Hermite_poly(x_values, f_values, df_values, 1.5);

error = abs(actual_value - approximate_value);

fprintf('\nAbsolute error of interpolation is: %.8f\n', error);


x_nodes = linspace(-5,5,5);
function_nodes = sin(2*x_nodes);
diff_function_nodes = 2*cos(2*x_nodes);

x_plot = linspace(-5,5,1000);
f_approximate_plot = Hermite_poly(x_nodes, function_nodes, diff_function_nodes, x_plot);


% f = @(x) exp(sin(2*x));
% 
% f_exact_plot = f(x_plot);

f_exact_plot = sin(2*x_plot);

% plot(x_nodes, function_nodes);

hold on;

plot(x_plot, f_exact_plot);
plot(x_plot, f_approximate_plot);

hold off;
grid on;



nodes = [8.3, 8.6];
function_nodes = [17.56492, 18.50515];
diff_function_nodes = [3.116256, 3.151762];

approximate_value = Hermite_poly(nodes, function_nodes, diff_function_nodes, 8.4);

fprintf('\nAproximarea functiei in 8.4 este: %.8f\n', approximate_value);


% f = @(x) 3*x*exp(x)-exp(2*x);
% 
% df = @(x) 3*exp(x) + 3*x*exp(x) - 2*exp(2*x);
% 
% noduri = [1,1.05];
% f_noduri = f(noduri);
% df_noduri = df(noduri);
% 
% estimated_value = Hermite_poly(noduri, f_noduri, df_noduri, 1.03);
% 
% fprintf('Estimated value in 1.03 is: %8.f\n ', estimated_value);


