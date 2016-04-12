clear all;
close all;
load ../data/male

x = male400(:,1);
t = male400(:,2);
N = length(x);

m_x = sum(x)/N;
m_t = sum(t)/N;
m_xt = sum(x.*t)/N;
m_xx = sum(x.*x)/N;

w_1 = (m_xt - m_x*m_t)/(m_xx - m_x^2);
w_0 = m_t - w_1*m_x;

figure(1);hold off
plot(x,t,'bx','markersize',10,'linewidth',2)
xplot = [min(x)-4 max(x)+20];
xlim(xplot);
hold on
plot(xplot, w_0+w_1*xplot,'r','linewidth',2)
xlabel('Olympic year');
ylabel('Winning time');

xpred = [2012 2016];
tpred = w_0 + w_1*xpred;

for i = 1:length(xpred)
    fprintf('\n Predicted winning time in %g is: %g seconds',xpred,tpred);
end

plot(xpred,tpred,'k^','markersize',10,'markerfacecolor','k');