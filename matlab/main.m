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
    a, sin(a), 'g.',
    a, a .* cos(a), 'b-',
    a, a .* sin(a), 'y-',
    a, sin(a) + a .* cos(a), '.-',
    ap, pi/2, '*k',
    -ap, -pi/2, '*k'
);
hold on;
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

r1 = 1;
r2 = 2*r1.*sin(a/2);
A = r1.*r2.*cos(a/2);

r1ap = 1;
r2ap = 2*r1ap.*sin(ap/2);
Ap = r1ap.*r2ap.*cos(ap/2);

S1r = a.*r2.^2/2;
S2r = (pi-a).*r1.^2;

S1 = S1r+S2r-A/2;
S2 = a.*r1.^2-a.*r2.^2/2+A/2;

plot(
    a, r2, 'r-', 
    a, A, 'g-',
    a, S1r, 'k-',
    a, S2r, '-',
    a, S1, 'b.',
    a, S2, 'y.',
    a, S1+S2, 'b-',
    ap, Ap, '*k'
);

% Set x-ticks at multiples of pi
xarr = -pi:pi/2:pi;
xarr = [xarr, [ap, -ap, pi/4, 3*pi/4, ap-pi/2+pi/4]];
xticks(xarr);

% Label the x-ticks using pi notation
xticklabels({'-\pi', '-\pi/2', '0', '\pi/2', '\pi', num2str(ap), num2str(-ap), '\pi/4', '3\pi/4', 'aa**'});
grid;


% Set the figure to fullscreen using the root screensize (adjust position for right pane)
set(gcf, 'Units', 'normalized', 'Position', [0.5 0.5 0.5 0.5]);
hold off;
