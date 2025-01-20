close all; clear all

my_data_noise = 'noisy-sine-data.txt';
my_data_clean = 'clean-at-random-points.txt';
data1 = readmatrix(my_data_noise);
data2 = readmatrix(my_data_clean);

x1 = data1(:, 1); % First column: x values
y1 = data1(:, 2); % Second column: y values

x2 = data2(:, 1); % First Column: x values of noise points
y2 = data2(:, 2); % Second Column: y values of noise points in the clean sine wave function

x = linspace(0, 10, 1000); %will enable high-resolution regression curves

E = zeros(1,10);


for n = 0:9 
    p = polyfit(x1,y1,n);
    yhat = polyval(p,x); %evaluates the polynomial at x1
    figure;

    scatter(x1,y1,'ro', 'filled');
    hold on;

    plot(x, yhat, 'LineWidth', '1.5','DisplayName',sprintf('Degree %d', n) );

    xlim([0, 10]);
    
    E(n+1) = norm(y1-yhat, 2)^-2;% Calculate reciprocal of squared error
    savefigure(x,y,x1, y1, polyval(p,x), n)
end


figure