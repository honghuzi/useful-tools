


% load Ne_0.4_800nm.mat
load( '../dat/Ar0' );
load('../dat/laserparameter'); % Up;
                               % Gridparameters; % same spatial grid used for calculating the electron spectra
Rx=200;             % space box
Ry=200;
% Kx=1024*4;          % space grid
% Ky=1024*4;
Ks=1024*4;
% x=linspace(-Rx,Rx,Kx);
% y=linspace(-Ry,Ry,Ky);


% dx=2*Rx/(Kx-1);
% dy=2*Ry/(Ky-1);

dx=2*Rx/(Ks-1);
dy=2*Ry/(Ks-1);


pmx=2*pi/dx;
pmy=2*pi/dy;
px=linspace(-pmx/2,pmx/2,Ks);
py=linspace(-pmy/2,pmy/2,Ks);
[ppx,ppy]=meshgrid(px,py);
% dpx=2*pi/(L0);
% dpy=2*pi/(L0);
% figure
% % N_plot=(Ks/2-1100):(Ks/2+1100);
% N_plot=(Ks/2-200):(Ks/2+200);
% % pxm=ppx(N_plot,N_plot);
% % pym=ppy(N_plot,N_plot);
% % YYp=YY(N_plot,N_plot);
% ppp=pp(N_plot,N_plot);
% imagesc(px(N_plot),py(N_plot),log10(abs(ppp).^2));
% axis xy;

% r=linspace(0,4,2000); % ������ rά ��� 
r=linspace(0,20*Up,2000); % ������ rά ��� 
dr=r(2)-r(1);
theta=linspace(0,2*pi,2000); % thetaά ���
dtheta=theta(2)-theta(1);
[R Theta]=meshgrid(r,theta);
[x y]=pol2cart(Theta,R); % �������ֱ������
YYint=interp2(ppx,ppy,abs(pp).^2,x,y); % ��������ת��������������ԭ�еĸ���ϲ�ֵ


% figure;
% surf(R,Theta/pi,log10(YYint));
% view(2);
% shading interp %����ɫ�ʵĲ�ֵ����ʹɫ��ƽ������ ����matlab���Զ�����ԭ�м�����Ĵ�С˳������Ӧ�Ķ����׷�ֵ�������ţ��õ���R��ThetaΪ��ķֲ���


% figure;
% plot(theta/pi,sum(YYint,2)) % ����ֲ�   


figure;
plot(r/Up,sum(YYint,1)) % ����ֲ�
