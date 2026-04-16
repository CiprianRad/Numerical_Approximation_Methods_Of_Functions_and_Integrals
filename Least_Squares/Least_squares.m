clear;clc;

x = [9, 10, 11, 12, 13, 14, 15];
f = [12, 10, 8, 11, 15, 17, 13];
m_plus_1 = length(x);

sum_x = sum(x);
sum_f = sum(f);
sum_x2 = sum(x.^2);
sum_xf = sum(x .* f);

denom = m_plus_1 * sum_x2 - (sum_x)^2;
a = (m_plus_1 * sum_xf - sum_x * sum_f) / denom;
b = (sum_x2 * sum_f - sum_xf * sum_x) / denom;

estimated_temparature = a * 16 + b;

phi_val = a * x + b;
E_ab = sum((f - phi_val).^2);

fprintf('Functie de aproximare este: %.4fx + %.4f\n', a, b);
fprintf('Temperatura estimata la ora 4: %.4f\n', estimated_temparature);
fprintf('Eroare minima este: %.4f\n', E_ab);

figure;
plot(x, f, 'ro');
hold on;
x_line = 9:0.1:16;
y_line = a * x_line + b;
plot(x_line, y_line);
grid on;

%%

clear;clc;

alt = [0, 500, 1000, 2500, 5000, 8500];
ox = [20.9, 19.6, 18.4, 15.3, 11.2, 7.2];

p1 = polyfit(alt, ox, 1);
p2 = polyfit(alt, ox, 4);

estimation_1_p1 = polyval(p1, 753);
estimation_1_p2 = polyval(p2, 753);
estimation_2_p1 = polyval(p1, 6000);
estimation_2_p2 = polyval(p2, 6000);

err_p1 = abs(9.9 - estimation_2_p1);
err_p2 = abs(9.9 - estimation_2_p2);

fprintf('La 753m: P1=%.4f, P2=%.4f\n', estimation_1_p1, estimation_1_p2);
fprintf('La 6000m: P1=%.4f, P2=%.4f\n', estimation_2_p1, estimation_2_p2 );
fprintf('Eroare la 6000m: P1_err=%.4f, P2_err=%.4f\n', err_p1, err_p2);

pol_inter = polyfit(alt, ox, length(alt) - 1);

x_plot = -10:10:10000;
y1 = polyval(p1, x_plot);
y2 = polyval(p2, x_plot);
val_pol_inter = polyval(pol_inter, x_plot);

figure;
plot(alt, ox, 'ro');
hold on;
plot(x_plot, y1);
plot(x_plot, y2);
plot(x_plot, val_pol_inter);
grid on;

%%

clear;clc;

figure;
axis([0 3 0 5]);
grid on;
hold on;

[x, y] = ginput(10);

plot(x, y, 'bo');

p = polyfit(x, y, 2);

x_plot = linspace(0, 3, 100);
y_plot = polyval(p, x_plot);

plot(x_plot, y_plot);

%%

clear; clc;

tema = [302, 325, 285, 339, 334, 322, 331, 279, 316, 347, 343, 290, 326, 233, 254];
final = [45, 72, 54, 54, 79, 65, 99, 63, 65, 99, 83, 74, 76, 57, 45];

m_plus_1 = length(tema);

sum_x = sum(tema);
sum_y = sum(final);
sum_x2 = sum(tema.^2);
sum_xy = sum(tema .* final);

denom = m_plus_1 * sum_x2 - (sum_x)^2;
a = (m_plus_1 * sum_xy - sum_x * sum_y) / denom;
b = (sum_x2 * sum_y - sum_xy * sum_x) / denom;

fprintf('Ecuatia dreptei este: y = %.4fx + %.4f\n', a, b);

tema_90 = (90 - b) / a;
tema_50 = (50 - b) / a;

fprintf('Punctaj la tema necesar pentru minim 90%%: %.2f\n', tema_90);
fprintf('Punctaj la tema necesar pentru minim 50%%: %.2f\n', tema_50);


figure;
plot(tema, final, 'ro');
hold on;

x_line = min(tema)-10 : 1 : max(tema)+10;
y_line = a * x_line + b;

plot(x_line, y_line);
grid on;
