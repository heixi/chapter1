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
xplot = [min(x)-4 max(x)+4];
xlim(xplot);
hold on
plot(xplot, w_0+w_1*xplot,'r','linewidth',2)
xlabel('Olympic year');
ylabel('Winning time');