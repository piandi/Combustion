%% 不同环境加热作用下的轴线流速变化
%   即获得P67，图3-13
T10 = 5;
X = 0.5:0.1:5;
for i = 1:length(X)
    x = X(i);
    eq3_93 = @(y)(x - 0.7/y*sqrt((1+0.735*(T10-1)*y))); % 式(3-85)
    Y(i) = fsolve(eq3_93, 1);
end

plot(X, Y)
xlim([0,5])
ylim([0,1])
xlabel('$ax/R_{0}$', 'Interpreter', 'latex')
ylabel('$\Delta T_{zs}/T_1$', 'Interpreter', 'latex')
hold on;