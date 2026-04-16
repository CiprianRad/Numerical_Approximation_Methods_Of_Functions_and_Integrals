%%

clear; clc;

x_nodes = [0, pi/2, pi, 3*pi/2, 2*pi];
y_nodes = sin(x_nodes);

x_eval = pi/4;
val_exact = sin(x_eval);

val_spline_nat = spline(x_nodes, y_nodes, x_eval);

y_nodes_clamped = [1, y_nodes, 1];
val_spline_clamp = spline(x_nodes, y_nodes_clamped, x_eval);

fprintf('Function value in x=pi/4: %f\n', val_exact);
fprintf('Natural splien value in x=pi/4: %f\n', val_spline_nat);
fprintf('Clmaped spline value in x=pi/4: %f\n', val_spline_clamp);


%%
x_plot = linspace(0, 2*pi, 100);

y_exact = sin(x_plot);
y_spline_nat_plot = spline(x_nodes, y_nodes, x_plot);
y_spline_clamp_plot = spline(x_nodes, y_nodes_clamped, x_plot);

figure;
plot(x_plot, y_exact);
hold on;
plot(x_plot, y_spline_nat_plot);
plot(x_plot, y_spline_clamp_plot);

grid on;
hold off;

%%

figure;
grid on;
hold on;

[x_points, y_points] = ginput(5);

[x_sorted, indexes] = sort(x_points);
y_sorted = y_points(indexes);

x_plot = linspace(min(x_sorted), max(x_sorted), 200);

y_plot = spline(x_sorted, y_sorted, x_plot);


plot(x_sorted, y_sorted)
% plot(x_plot, y_plot);

hold off;

%%

clear; clc;

t = [0, 3, 5, 8, 13];
d = [0, 225, 383, 623, 993];

v_start = 75;
v_end = 72;

d_clamped = [v_start, d, v_end];

t_eval = 10;

estimated_distance = spline(t, d_clamped, t_eval);

h = 1e-6;
approximate_position = spline(t, d_clamped, t_eval + h);
estimated_speed = (approximate_position - estimated_distance) / h;

fprintf('At point t = %d s:\n', t_eval);
fprintf('Distance at point t is: %.2f feet\n', estimated_distance);
fprintf('Speed at point t is: %.2f feet/s\n', estimated_speed);

%%

clear;clc;

x_nodes = 0 : pi/4 : 2*pi;
y_nodes = cos(x_nodes);

x_plot = linspace(0, 2*pi, 200);

y_exact = cos(x_plot);

figure;
hold on; 
grid on;

plot(x_plot, y_exact);
plot(x_nodes, y_nodes);
hold off;
