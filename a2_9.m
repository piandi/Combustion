%% 习题2-9
% by Dr. GUAN Guoqiang @ SCUT on 2019-9-27
%
%% NO2的分解速率
% 反应速率表达式为 W = kf*C^2;
kf = 498; C = 3e-6;
W = kf*C^2;
% 输出
fprintf('kf = %.1f mL/(mol-s), NO2的浓度为 %.3e mol/mL时，NO2的分解速率为 %.3e mol/(mL-s)\n', kf, C, W);
%% 用阿累尼乌斯公式关联反应活化能
% ln k = ln k0 - E/RT
% 输入不同温度下的反应速率常数
R = 8.3145;
T = [603.5; 627.0; 651.5; 656.0];
k = [775; 1810; 4110; 4740];
% 构造计算表
dataset = table(T, k);
% 构造计算变量
X = ones(height(dataset), 2);
X(:,2) = (1/R)./dataset.T;
Y = log(dataset.k);
B = X\Y;
% 显示回归结果
est_Y = X*B;
RSQ = 1 - sum((Y - est_Y).^2)/sum((Y - mean(Y)).^2);
% 列表显示
dataset = [dataset, table(Y, est_Y)]
% 画图显示
scatter(X(:,2), Y); hold on;
plot(X(:,2), est_Y)
xlabel('1/(RT)'); 
ylabel('log(k)');
grid on;
title('Regression of chemical kinetic parameters');
legend('Data', 'Linear fitting curve', 'Location', 'best');
% output
E = -B(2);
k0 = exp(B(1));
fprintf('回归计算活化能为 %.3e J/(mol-K)，相关系数R2 = %.4f\n', E, RSQ);