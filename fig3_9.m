%% 不同环境加热作用下的轴线流速变化
%   即获得P65中的图3-9
clear
Theta = [0.1 0.2 0.5 1 2 5 10];
Color = ['r' 'g' 'b' 'c' 'm' 'y' 'k'];
Xmesh = 0.5:0.1:5;
Ymesh = zeros(size(Xmesh));
for j = 1:length(Theta)
    for i = 1:length(Xmesh)
        x = Xmesh(i);
        eq3_85a = @(y)(x - 0.96/y*sqrt((1+0.535*(Theta(j)-1)*y)/Theta(j))); % 式(3-85)
        Ymesh(i) = fsolve(eq3_85a, 1);
    end
    plot(Xmesh, Ymesh, Color(j))
    hold on;
end
xlim([0,5])
ylim([0,1])
xlabel('$ax/R_{0}$', 'Interpreter', 'latex')
ylabel('$w_{zs}/w_1$', 'Interpreter', 'latex')

% 符号解求Theta为无穷时的无因次轴线速度与射程的关系
syms X Y Theta
eq3_85 = X == 0.96/Y*sqrt((1+0.535*(Theta-1)*Y)/Theta);
sol1 = solve(eq3_85,Y);
Y1 = limit(sol1(2),Theta,inf);
for i = 1:length(Xmesh)
    Ymesh(i) = eval(subs(Y1,X,Xmesh(i)));
end
plot(Xmesh,Ymesh,'k--')

% 求以无因次射程表示的射流初始段长度（X）与射流温度与环境温度比（Theta）的关系
sol2 = solve(subs(eq3_85,X,1),Y);
figure
plot([0.1 0.2 0.5 1 2 5 10], eval(subs(sol2(2),Theta,[0.1 0.2 0.5 1 2 5 10])), 'ro-')
xlabel('$\Theta$', 'Interpreter', 'latex')
ylabel('$ax/R_{0}$', 'Interpreter', 'latex')