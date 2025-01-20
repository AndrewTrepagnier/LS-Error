% Preallocate a cell array to store P_n values for each degree
P_n = cell(1, 10); % Cell array for storing P_n(x1) for n = 0 to 9
E_n_regressions = zeros(1, 10); % Preallocate an array to store LS-Errors for each degree
E_n_sine = zeros(1, 10);


for n = 0:9     % Loop through polynomial degrees and create individual plots for each
    
    % Fit polynomial of degree n
    p = polyfit(x1, y1, n); 
    yhat = polyval(p, x); % Evaluate the polynomial on the high-resolution x range

    % Extract P_n(x1) values and store them in the cell array
    P_n{n+1} = polyval(p, x1); % Save P_n for degree n at index n+1 (since MATLAB indices start at 1)
    
    % Plotting individual regressions
    figure; % Create a new figure for each polynomial regression
    scatter(x1, y1, 'ro', 'filled'); 
    hold on; % Retain the current plot for adding the regression line
    
    plot(x, yhat, 'LineWidth', 1.5, 'DisplayName', sprintf('Degree %d', n)); % Plot the regression curve for degree n

    xlim([0, 10]);
    ylim([-20, 20]);
    
    xlabel('x');
    ylabel('y');
    title(sprintf('Data Points and Polynomial Regression (Degree %d)', n));
    legend('Data Points', sprintf('Degree %d Fit', n), 'Location', 'best');
    grid on;
    hold off; % Release the plot after adding the regression

    % Save the figure to a file
    saveas(gcf, sprintf('regression_degree_%d.png', n)); % Save as PNG

    %% LS-Error Calculation of Polyvals
    % Calculate the least squares error for degree n
    E_n_regressions(n+1) = sum((y1 - P_n{n+1}).^2); % Sum of squared errors fir the regression lines

    %% LS-Error for Clean Sine Wave Y Values
    E_n_sine(n+1) = sum((y2 - P_n{n+1}).^2); % Sum of squared errors for the original sine wave

end
%% LS-Error Plots

% Plot E_n versus n on a single scatter plot
figure;
scatter(0:9, E_n_regressions, 50, 'b', 'filled'); % Scatter plot of regression LS-Error
hold on;
plot(0:9, E_n_regressions, 'r-', 'LineWidth', 1.5); % Line plot through the regression error points

scatter(0:9, E_n_sine, 50, 'g', 'filled'); % Scatter plot of sine LS-Error
plot(0:9, E_n_sine, 'p-', 'LineWidth', 1.5); % Line plot through the sine error points

%% LS-Error Graph
xlabel('Polynomial Degree (n)');
ylabel('Least Squares Error (E_n)');
title('LS-Error for each Nth Order Polynomial Polyfit Equation');

% Fix the legend to correspond to all components
legend('Regression Error (Scatter)', 'Regression Error (Line)', ...
       'Sine Error (Scatter)', 'Sine Error (Line)', ...
       'Location', 'best');

grid on;
xlim([-1, 10]); % Slightly extend x-axis for better visualization
ylim([0, 2000]); % Slightly extend y-axis for better visualization

disp('Figures saved successfully.');
disp('E_n values plotted.');
