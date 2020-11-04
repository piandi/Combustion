%% 射流燃烧升温（T1/T0）对轴线上的无因次剩余温度、浓度的影响
%   即获得P67中的图3-13
T10 = [5 2 1];
Xmesh = 0.5:0.1:5;
Ymesh = zeros(size(Xmesh));
yyaxis left
for j = 1:length(T10)
    for i = 1:length(Xmesh)
        X = Xmesh(i);
        eq3_93a = @(Y)(X - 0.7/Y*sqrt((1+0.735*(T10(j)-1)*Y))); % 式(3-93a)
        Ymesh(i) = fsolve(eq3_93a, 1);
    end
    plot(Xmesh, Ymesh)
    hold on;
end
xlim([0,5])
ylim([0,1])
xlabel('$ax/R_{0}$', 'Interpreter', 'latex')
ylabel('$\Delta T_{zs}/T_1$ or ($\Delta c_{zs}/c_1$)', 'Interpreter', 'latex')
legend('T_1/T_0 = 5', 'T_1/T_0 = 2', 'T_1/T_0 = 1')
% P67中的图3-12
yyaxis right
for j = 1:length(T10)
    for i = 1:length(Xmesh)
        X = Xmesh(i);
        eq3_90a = @(Y)(X - 0.96/Y*sqrt((1+0.535*(T10(j)-1)*Y))); % 式(3-90a)
        Ymesh(i) = fsolve(eq3_90a, 1);
    end
    plot(Xmesh, Ymesh)
    hold on;
end
xlim([0,5])
ylim([0,1])
xlabel('$ax/R_{0}$', 'Interpreter', 'latex')
ylabel('$w_{zs}/w_0$', 'Interpreter', 'latex')
legend('T_1/T_0 = 5', 'T_1/T_0 = 2', 'T_1/T_0 = 1')