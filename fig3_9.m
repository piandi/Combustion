%% 不同环境加热作用下的轴线流速变化
%   即获得P65，图3-9
Theta = 10;
X = 0.5:0.1:5;
for i = 1:length(X)
    x = X(i);
    eq3_85 = @(y)(x - 0.96/y*sqrt((1+0.535*(Theta-1)*y)/Theta)); % 式(3-85)
    Y(i) = fsolve(eq3_85, 1);
end

plot(X, Y)
xlim([0,5])
ylim([0,1])
xlabel('$ax/R_{0}$', 'Interpreter', 'latex')
ylabel('$w_{zs}/w_1$', 'Interpreter', 'latex')
hold on;