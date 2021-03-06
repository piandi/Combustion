%% 课后作业3-17
%
% by Dr. Guan, Guoqiang @ SCUT on 2019-10-23
%
%% 初始化
clear;
% 喷嘴出口燃料浓度和燃尽浓度
c1 = 0.62; clr = 0.2;
% 湍流参数
a = 0.08;
% 原方型喷嘴尺寸（边长）
b0 = 0.4;
% 原方型喷嘴截面积
A0 = b0*b0;
%% 计算理论燃尽火焰长度，即式(3-97)
% 无因次理论燃尽火焰长度X = x*a/R0
X = 0.7*c1/clr*sqrt((1+c1)/(1+0.77*clr));
% 润湿周边
WettedPerimeter = [4*b0; sqrt(8*pi*A0); sqrt(32*A0); 4*(0.2+0.4)];
% 喷嘴特征长度R0（=1/2当量直径=两倍水力半径）
HydraulicRadius = A0./WettedPerimeter;
R0 = HydraulicRadius*2;
str_nozzle = {'0.4x0.4 square', 'eq.Area 2 circular', ...
              'eq.Area 2w square', '0.2x0.4 square'};
% 理论燃尽火焰长度x
x = X*R0./a;
%% 输出
prompt = 'Theoretical lengths of flame for varied nozzles with the same cross-section area are respectively listed as';
fprintf('%s \n', prompt);
output = table(R0, x, 'RowNames', str_nozzle);
disp(output)
fprintf('It indicates that the larger influent size of nozzle has the longer flame. \n')