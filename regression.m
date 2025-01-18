 close all; clear all
% The commented-out code is Dr. Seongjia Kim's
% 
% a = 0; b = 1; m = 10;
% f = @(t) sin(2*pi*t);
% 
% DATAFILE = 'sine-noisy-data.txt';
% renew_data = 0
% 
% 
% %%----------------------------------
% if isfile(DATAFILE) && renew_data == 0
%     DATA = readmatrix(DATAFILE);        % np.loadtxt()
% else 
%     X = linespace(a,b,m); YO = f(X);
%     noise = rand(1,m); noise = noise-mean(noise(:));
%     Y = YO +noise; DATA = [X', Y'];
%     writematrix(DATA, DATAFILE);        % np.savetxt()
% 
% %%------------------------------------
% 
% x = linespace(a,b, 101); y = f(x);
% x1 = DATA(:,1); y1 = DATA(:,2);
% E = zeros(1,m);
% 
% for n = 0:m-1
%     p = polyfit(x1,y1,n);
%     yhat = polyval(p,x1);
%     E(n+1) = norm(y1-yhat, 2)^-2;
%     %savefigure(x,y,x1, y1, polyval(p,x), n)
% end
% % figure

%%---------------------------------------
% Read the data from the txt file, plot the noisy points, then make a
% regression line through the points using a 1-10 order polynomial

my_data_file = 'noisy-sine-data.txt';
data = readmatrix(my_data_file);

x1 = data(:, 1); % First column: x values
y1 = data(:, 2); % Second column: y values

x = linspace(0, 10, 1000); %will enable high-resolution regression curves

E = zeros(1,10);


for n = 0:9 
    p = polyfit(x1,y1,n);
    yhat = polyval(p,x); %evaluates the polynomial at x1
    figure;

    scatter(x1,y1,'ro', 'filled');
    hold on;

    plot(x, yhat, 'LineWidth', '1.5', )
    E(n+1) = norm(y1-yhat, 2)^-2;% Calculate reciprocal of squared error
    savefigure(x,y,x1, y1, polyval(p,x), n)
end


figure