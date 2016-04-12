clear all;
close all;

x = [-5 5];

w0 = [1:1:20];
w1 = [0:0.4:8];

figure(1);
hold off;

for i = 1:length(w0)
    plot(x, w0(i) + w1(i).*x);
    hold all
    fprintf('\ny = %g + %g x',w0(i),w1(i));
end