%% �κ���ҵ3-16
%
% by Dr. GUAN Guoqiang @ SCUT on 2019-10-18
%
%% ��ʼ��
clear
syms c_tmp;
% ����ʣ���¶Ȼ�Ũ�Ⱥ���
d = @(x,x0)(x-x0);
% �����¶Ⱥ�Ũ��
T2 = 27+273.15; c2 = 0;
% ��������ʵ���¶Ȳ���
T = [40;38.4;35.4;31.6;27]+273.15;
c = zeros(size(T));
% �������������¶�
T_zs = T(1);
% ���������¶Ⱥ�Ũ��
T1 = 57+273.15; c1 = 0.6;
%% ����Գ��������ߵ��¶Ⱥ�Ũ�ȹ�ϵ����ʽ(3-64)���ɵ�����a���Ũ��
% dc_zs/dc1 = dT_zs/dT1
dc_zs = d(c1,c2)*d(T_zs,T2)/d(T1,T2);
%% �������������ԣ���ʽ(3-44)������ȼ���dc/dc_zs = dT/dT_zs
dc = dc_zs*d(T,T2)/d(T_zs,T2);
for i = 1:length(T)
    c(i) = eval(solve(d(c_tmp,c2)==dc(i)));
end
%% ������Ũ�Ȳ���
LocNotation = {'a';'b';'c';'d';'e'};
output = table(T, c, 'RowNames', LocNotation);
output.Properties.VariableUnits = {'K','kg/kg'};
disp(output)