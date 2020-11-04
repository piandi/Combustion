%% 课后作业3-16
%
% by Dr. GUAN Guoqiang @ SCUT on 2019-10-18
%
%% 初始化
clear
syms c_tmp;
% 定义剩余温度或浓度函数
d = @(x,x0)(x-x0);
% 环境温度和浓度
T2 = 27+273.15; c2 = 0;
% 测量截面实测温度侧型
T = [40;38.4;35.4;31.6;27]+273.15;
c = zeros(size(T));
% 测量截面轴线温度
T_zs = T(1);
% 射流出口温度和浓度
T1 = 57+273.15; c1 = 0.6;
%% 由轴对称射流轴线的温度和浓度关系，即式(3-64)，可得轴线a点的浓度
% dc_zs/dc1 = dT_zs/dT1
dc_zs = d(c1,c2)*d(T_zs,T2)/d(T1,T2);
%% 由射流自相似性，即式(3-44)，可类比计算dc/dc_zs = dT/dT_zs
dc = dc_zs*d(T,T2)/d(T_zs,T2);
for i = 1:length(T)
    c(i) = eval(solve(d(c_tmp,c2)==dc(i)));
end
%% 表格输出浓度侧型
LocNotation = {'a';'b';'c';'d';'e'};
output = table(T, c, 'RowNames', LocNotation);
output.Properties.VariableUnits = {'K','kg/kg'};
disp(output)