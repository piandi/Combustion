%% ϰ��2-9
% by Dr. GUAN Guoqiang @ SCUT on 2019-9-27
%
%% NO2�ķֽ�����
% ��Ӧ���ʱ��ʽΪ W = kf*C^2;
kf = 498; C = 3e-6;
W = kf*C^2;
% ���
fprintf('kf = %.1f mL/(mol-s), NO2��Ũ��Ϊ %.3e mol/mLʱ��NO2�ķֽ�����Ϊ %.3e mol/(mL-s)\n', kf, C, W);
%% �ð�������˹��ʽ������Ӧ���
% ln k = ln k0 - E/RT
% ���벻ͬ�¶��µķ�Ӧ���ʳ���
R = 8.3145;
T = [603.5; 627.0; 651.5; 656.0];
k = [775; 1810; 4110; 4740];
% ��������
dataset = table(T, k);
% ����������
X = ones(height(dataset), 2);
X(:,2) = (1/R)./dataset.T;
Y = log(dataset.k);
B = X\Y;
% ��ʾ�ع���
est_Y = X*B;
RSQ = 1 - sum((Y - est_Y).^2)/sum((Y - mean(Y)).^2);
% �б���ʾ
dataset = [dataset, table(Y, est_Y)]
% ��ͼ��ʾ
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
fprintf('�ع������Ϊ %.3e J/(mol-K)�����ϵ��R2 = %.4f\n', E, RSQ);