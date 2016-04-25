clear;

load /male.mat;
X = male400(:,1);
Y = male400(:,2);

X = X-X(1);
X = X./4;
figure(1); hold on
plot(X,Y,'bo','markersize',10);
plotX = [min(X):0.01:max(X)];
x = [plotX.^0; plotX];

X = [X.^0 X];

epsilon = 0.0003;
gamma = 0.0001;

w_old = zeros(size(X,2),1);
k = 1;
t = 1000;
while 1
    minJ_w(k) = 1/2 * (norm(X*w_old - Y))^2;
    w_new = w_old - gamma*(X'*X*w_old - X'*Y);
    fprintf('The %dth iteration, minJ_w = %f, \n',k,minJ_w(k));
    if k == t
        plot(plotX,w_new'*x);
        t = t + 500;
    end
    if norm(w_new-w_old) < epsilon
        W_best = w_new;
        break;
    end
    w_old = w_new;
    k=k+1;
end
figure(2)
plot(minJ_w);