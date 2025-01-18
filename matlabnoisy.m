% Load the noisy sine wave data from the text file
my_data_file = 'noisy-sine-data.txt';
data = readmatrix(my_data_file);

% Extract x and y values from the data
x1 = data(:, 1); % First column: x values
y1 = data(:, 2); % Second column: y values

% Generate a high-resolution x range for smooth regression curves
x = linspace(0, 10, 1000);

% Loop through polynomial degrees and create individual plots for each
for n = 0:9
    % Fit polynomial of degree n
    p = polyfit(x1, y1, n);
    yhat = polyval(p, x); % Evaluate the polynomial on the high-resolution x range

    % Create a new figure for each polynomial regression
    figure;
    scatter(x1, y1, 'ro', 'filled'); % Plot data points as red filled circles
    hold on; % Retain the current plot for adding the regression line
    
    % Plot the regression curve for degree n
    plot(x, yhat, 'LineWidth', 1.5, 'DisplayName', sprintf('Degree %d', n));

    % Set x and y axis limits
    xlim([0, 10]);
    ylim([-20, 20]);
    
    % Add labels, title, and legend
    xlabel('x');
    ylabel('y');
    title(sprintf('Data Points and Polynomial Regression (Degree %d)', n));
    legend('Data Points', sprintf('Degree %d Fit', n), 'Location', 'best');
    grid on; % Enable grid for better visualization
    hold off; % Release the plot after adding the regression

    % Save the figure to a file
    saveas(gcf, sprintf('regression_degree_%d.png', n)); % Save as PNG
end

disp('Figures saved successfully.');

