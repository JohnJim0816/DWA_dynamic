%% ���㶯̬����
% ���� ��С�ٶ� ����ٶ� ��С���ٶ� �����ٶ��ٶ�
function Vr = CalcDynamicWindow(x,model)

%��������˳�ʼ״̬x���±�(��main)
V_SPD       = 4;%�������ٶ�
W_ANGLE_SPD = 5;%�����˽��ٶ� 

%����model���±�
MD_MAX_V    = 1;%   ����ٶ�m/s]
MD_MAX_W    = 2;%   �����ת�ٶ�[rad/s]
MD_ACC      = 3;%   ���ٶ�[m/ss]
MD_VW       = 4;%   ��ת���ٶ�[rad/ss]

global dt; % ʱ��

% �����ٶȵ������С��Χ ����Ϊ����С�ٶ� ����ٶ� ��С���ٶ� �����ٶ��ٶ�
Vs=[0 model(MD_MAX_V) -model(MD_MAX_W) model(MD_MAX_W)];
 
% ���ݵ�ǰ�ٶ��Լ����ٶ����Ƽ���Ķ�̬����  ����Ϊ����С�ٶ� ����ٶ� ��С���ٶ� �����ٶ��ٶ�
Vd = [x(V_SPD)-model(MD_ACC)*dt x(V_SPD)+model(MD_ACC)*dt x(W_ANGLE_SPD)-model(MD_VW)*dt x(W_ANGLE_SPD)+model(MD_VW)*dt];
 
% ���յ�Dynamic Window
Vtmp = [Vs;Vd];  %2 X 4  ÿһ������Ϊ����С�ٶ� ����ٶ� ��С���ٶ� �����ٶ��ٶ�
Vr = [max(Vtmp(:,1)) min(Vtmp(:,2)) max(Vtmp(:,3)) min(Vtmp(:,4))];