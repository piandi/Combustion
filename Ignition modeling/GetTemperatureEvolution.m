global TW_set eta;
TW_set = 900;
eta = 5;
options = odeset('RelTol', 1e-4, 'AbsTol', 1e-4);
[time, temperature] = ode45(@HeatBalance, [0, 0.5e+2], TW_set, options);
plot(time, log10(temperature))
legend_str = sprintf('T_W = %.1f K, \\eta = %.1f', TW_set, eta);
legend(legend_str, 'Location', 'best');
xlabel('Time/[s]');
ylabel('log10(Temperature/[K])');
hold on

%% 算法比较
% 用有限差分法计算全隐式函数
T1 = zeros(size(time));
T1(1) = TW_set;
T2 = T1;
dt = diff(time);
for i = 1:length(diff(time))
    T1(i+1) = FDM_FullImplicit(@HeatBalance, T1(i), dt(i), 0);
    T2(i+1) = FDM_FullImplicit(@HeatBalance, T2(i), dt(i), 1);
end
plot(time, log10(T1), 'r--', 'DisplayName', 'Upwind scheme')
plot(time, log10(T2), 'b-.', 'DisplayName', 'Central scheme')

function y = FDM_FullImplicit(fcn, y0, dt, opt)
    switch opt
        case(0) % 上风差分格式
            y = y0+fcn(dt,y0)*dt;
        case(1) % 中心差分格式
            y1 = y0+fcn(dt,y0)*dt;
            y = y0+fcn(dt,0.5*(y0+y1))*dt;
    end
end