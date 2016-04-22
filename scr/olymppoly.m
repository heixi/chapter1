%% 
load ../data/olympics.mat

x = male100(:,1);
t = male100(:,2);

x = x - x(1);
x = x./4;

figure(1);hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number');
ylabel('Winning time');

%% linear model
plotx = [x(1)-2:0.01:x(end)+2]';
X = [];
plotX = [];
for k = 0:1
    X = [X x.^k];
    plotX = [plotX plotx.^k];
end
w = inv(X'*X)*X'*t;
figure(1);hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number');
ylabel('Winning time');
hold on
plot(plotx,plotX*w,'r','linewidth',2);

%% 
plotx = [x(1)-2:0.01:x(end)+2]';
X = [];
plotX = [];
for k = 0:2
    X = [X x.^k];
    plotX = [plotX plotx.^k];
end
w = inv(X'*X)*X'*t;
figure(1);hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number');
ylabel('Winning time');
hold on
plot(plotx,plotX*w,'r','linewidth',2)

%% 
plotx = [x(1)-2:0,01:x(end)+2]';
X = [];
plotX = [];
for k = 0:4
    X = [X x.^k];
    plotX = [plotX plotx.^k];
end
w= inv(X'*X)*X'*t;
figure(1);
hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number');
ylabel('Winning time');
hold on
plot(plotx,plotX*w,'r','linewidth',2)

%% 
plotx = [x(1)-2:0.01:x(end)+2]';
X = [];
plotX = []
for k = 0:8
    X = [X x.^k];
    plotX = [plotX plotx.^k];
end
w = inv(X'*X)*X'*t;
figure(1);
hold off
plot(x,t,'bo','markersize',10);
xlabel('Olympic number');
ylabel('Winning time');
hold on
plot(plotx,plotX*w,'r','linewidth',2)