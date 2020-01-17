%% ���¶�̬�ϰ�����Ϣ
%% update info of dynami obstacles
% �������: obstacle����(5*n������n��obstacle����)��ÿ���������ֱ�Ϊ [x(m) y(m) yaw(Rad) v(m/s) w(rad/s)]
% ��ÿ���ϰ�����¹�ʽӦΪ��x=x+v*dt*cos(yaw),y=y+v*dt*sin(yaw),yaw=yaw+w*dt,v=v,w=w
function obstacle=MoveObstacle(obstacle)
global dt;
B = [0 0 0 dt 0
     0 0 0 dt 0
     0 0 0 0  dt
     0 0 0 0  0
     0 0 0 0  0];
delta= B* obstacle;
for num=1:length(obstacle(1,:))
    temp = [cos(obstacle(3,num)) 0 0 0 0
            0  sin(obstacle(3,num)) 0 0 0
            0 0 1 0 0
            0 0 0 0 0
            0 0 0 0 0];
     delta(:,num)=temp*delta(:,num);
end
obstacle=obstacle+delta;
