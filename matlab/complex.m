% Define the range and resolution for the real and imaginary parts
real_range = linspace(-2*pi, 2*pi, 400);
imag_range = linspace(-2*pi, 2*pi, 400);

% Create a grid of complex numbers
[Re, Im] = meshgrid(real_range, imag_range);
AP = Re + 1i*Im;

% Evaluate the function over the grid
F = sin(AP) - AP.*cos(AP);

% Special value
ap_special = 1.905695729309883894882645;
f_ap_special = sin(ap_special) - ap_special*cos(ap_special);

% Plot the results
figure;

% Plot the magnitude
subplot(2, 1, 1);
imagesc(real_range, imag_range, abs(F));
hold on;
plot(ap_special, 0, 'ro');  % Mark the special ap value
hold off;
axis xy; % To place the origin at the bottom left
colorbar;
xlabel('Real part');
ylabel('Imaginary part');
title('|f(ap)|: Magnitude of f(ap)');

% Plot the phase (angle)
subplot(2, 1, 2);
imagesc(real_range, imag_range, angle(F));
hold on;
plot(ap_special, 0, 'ro');  % Mark the special ap value
plot(real_range, ones(size(real_range))*pi/2, 'g--');  % Line for pi/2
hold off;
axis xy; % To place the origin at the bottom left
colorbar;
xlabel('Real part');
ylabel('Imaginary part');
title('Phase of f(ap)');

% Adjust the figure for better visualization
colormap(jet);  % Use a color map for better visualization
