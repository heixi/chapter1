%% 
clear all;
close all;

%% 
load ../data/olympics

x = male100(:,1);
t = male100(:,2);
pos = find(x>1979);

x = x -x(1);
x = x./4;

valx = x(pos:end);
valt = t(pos:end);

x(pos:end) = [];
t(pos:end) = [];

orders = [1 4 8];

figure(1);hold off
plot(x,t,'bo','markersize',5);
hold all
plot(valx,valt,'ro','markersize',5);
plotx = [min(x):0.01:max(valx)]';
for i = 1:length(orders);
    X = [];
    plotX = [];
    valX = [];
    for k = 0:orders(i)
        X = [X x.^k];
        valX = [valX valx.^k];
        plotX = [plotX plotx.^k];
    end
    w = inv(X'*X)*X'*t;
    plot(plotx,plotX*w,'linewidth',2);
    
    val_loss(i) = mean((valX*w -valt).^2);
end
ylim([9 12]);
legend('Training','Validation','Linear','4th order','8th order');

for i = 1:length(orders)
    fprintf('\n Model order: %g, Validation loss: %g',...
        orders(i),val_loss(i));
end








