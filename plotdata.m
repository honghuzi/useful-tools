


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

% r=linspace(0,4,2000); % 极坐标 r维 格点 
r=linspace(0,20*Up,2000); % 极坐标 r维 格点 
dr=r(2)-r(1);
theta=linspace(0,2*pi,2000); % theta维 格点
dtheta=theta(2)-theta(1);
[R Theta]=meshgrid(r,theta);
[x y]=pol2cart(Theta,R); % 极坐标→直角坐标
YYint=interp2(ppx,ppy,abs(pp).^2,x,y); % 将极坐标转换来的新坐标在原有的格点上插值


% figure;
% surf(R,Theta/pi,log10(YYint));
% view(2);
% shading interp %进行色彩的插值处理，使色彩平滑过渡 这样matlab会自动根据原有极坐标的大小顺序对其对应的动量谱幅值进行重排，得到以R和Theta为轴的分布。


% figure;
% plot(theta/pi,sum(YYint,2)) % 角向分布   


figure;
plot(r/Up,sum(YYint,1)) % 径向分布
