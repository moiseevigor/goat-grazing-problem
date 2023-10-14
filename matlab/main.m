% Create a new figure
hFig = figure;

% Create the left subplot (subplot 1)
subplot(1, 2, 1);

% Set the figure to fullscreen using the root screensize
set(hFig, 'Units', 'normalized', 'Position', [0 0 1 1]);

a = linspace(-pi, pi, 1000);
G = sin(a) - a .* cos(a);

ap = 1.905695729309883894882645;

plot(
    a, G, 'r-', 
    a, sin(a), 'g-',
    a, a .* cos(a), 'b-',
    a, a .* sin(a), 'y-',
    a, sin(a) + a .* cos(a), '.-',
    ap, pi/2, '*k',
    -ap, -pi/2, '*k'
);
grid;

% Set font size for axes labels and title
set(gca, 'FontSize', 16);
xlabel('a', 'FontSize', 18);
ylabel('y', 'FontSize', 18);
title('G = sin(a) - a .* cos(a)', 'FontSize', 20);

% For legend font size
hLegend = legend('G = sin(a) - a .* cos(a)', 'sin(a)', '-a .* cos(a)', 'a .* sin(a)', 'sin(a) + a .* cos(a)');
set(hLegend, 'FontSize', 16);

% Set x-ticks at multiples of pi
xarr = -pi:pi/2:pi;
xarr = [xarr, [ap, -ap, pi/4, 3*pi/4]];
xticks(xarr);

% Label the x-ticks using pi notation
xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi', num2str(ap), num2str(-ap), '\pi/4', '3\pi/4'});

% Set y-ticks at multiples of 1
yticks(-4:1:4);

line(get(gca, 'XLim'), [pi/2 pi/2], 'Color', 'k', 'LineStyle', '--');
line(get(gca, 'XLim'), [pi pi], 'Color', 'k', 'LineStyle', '--');
line(get(gca, 'XLim'), [-pi/2 -pi/2], 'Color', 'k', 'LineStyle', '--');
line(get(gca, 'XLim'), [-pi -pi], 'Color', 'k', 'LineStyle', '--');

% Get current y-ticks and their labels
currentYTicks = get(gca, 'YTick');
currentYTickLabels = get(gca, 'YTickLabel');

% Add pi/2 to the y-ticks
newYTicks = [currentYTicks, pi, pi/2, -pi/2, -pi];
set(gca, 'YTick', newYTicks);

a = src.Value;
G = sin(a) - a .* cos(a);

% Get the current figure and clear it
fig = gcf;
clf(fig);

% Create the left subplot (subplot 1)
subplot(1, 2, 1);

plot(
    a, G, 'r-', 
    a, sin(a), 'g-',
    a, a .* cos(a), 'b-',
    a, a .* sin(a), 'y-',
    a, sin(a) + a .* cos(a), '.-',
    ap, pi/2, '*k',
    -ap, -pi/2, '*k'
);
grid;

% Set font size for axes labels and title
set(gca, 'FontSize', 16);
xlabel('a', 'FontSize', 18);
ylabel('y', 'FontSize', 18);
title('G = sin(a) - a .* cos(a)', 'FontSize', 20);

% For legend font size
hLegend = legend('G = sin(a) - a .* cos(a)', 'sin(a)', '-a .* cos(a)', 'a .* sin(a)', 'sin(a) + a .* cos(a)');
set(hLegend, 'FontSize', 16);

% Set x-ticks at multiples of pi
xarr = -pi:pi/2:pi;
xarr = [xarr, [ap, -ap, pi/4, 3*pi/4]];
xticks(xarr);

% Label the x-ticks using pi notation
xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi', num2str(ap), num2str(-ap), '\pi/4', '3\pi/4'});

% Set y-ticks at multiples of 1
yticks(-4:1:4);

line(get(gca, 'XLim'), [pi/2 pi/2], 'Color', 'k', 'LineStyle', '--');
line(get(gca, 'XLim'), [pi pi], 'Color', 'k', 'LineStyle', '--');
line(get(gca, 'XLim'), [-pi/2 -pi/2], 'Color', 'k', 'LineStyle', '--');
line(get(gca, 'XLim'), [-pi -pi], 'Color', 'k', 'LineStyle', '--');

% Get current y-ticks and their labels
currentYTicks = get(gca, 'YTick');
currentYTickLabels = get(gca, 'YTickLabel');

% Add pi/2 to the y-ticks
newYTicks = [currentYTicks, pi, pi/2, -pi/2, -pi];
set(gca, 'YTick', newYTicks);

% Create the right subplot (subplot 2)
subplot(1, 2, 2);

% Your code for the second plot goes here...

% Set the figure to fullscreen using the root screensize (adjust position for right pane)
set(gcf, 'Units', 'normalized', 'Position', [0.5 0.5 0.5 0.5]);
hold off;
