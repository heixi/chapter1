close all;

x = [-5 5];
figure(1);
hold off
fprintf('\nKeep plotting lines on the current plot until you quit\n');
while 1
    intercept = str2num(input('Enter intercept:', 's'));
    gradient = str2num(input('Enter gradient', 's'));
    plot(x, intercept + gradient.*x);
    hold all
    fprintf('\n y = %g +%g x\n\n', intercept, gradient);
end