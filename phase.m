clear;
title('InGaZnO_4')
%ONLY r0, r1, r2, r3 needs to be inputted
%DH(RAMO$, ex: InGaZnO4)
r0=-11.62;
%DH(R2O3, ex: In2O3)
r1=-8.17;
%DH(A2O3, ex: Ga2O3)
r2=-8.23;
%DH(MO, ex:ZnO)
r3=-3.42;

o1=-1.123;
o2=-1.529;

pres1=4*(r0/4-o1)
pres2=4*(r0/4-o2)

%Change -14 to DH r0(integer)
% set(gca,'FontSize',18)
% set(gca,'XTick',[-11:2:0])
% set(gca,'YTick',[-11:2:0])
% set(gca,'ZTick',[-11:2:0])
%  
% %Below 3 lines for different k for Zn
% rk2=-14.20;
% r22=rk2/2
% p22=r0-r22
% c22=(4*rk2-5*r0)/3
% 
% rk3=-17.17;
% r33=rk3/3
% p33=r0-r33
% c33=(4*rk3-6*r0)/6
% 
% rk4=-20.06;
% r44=rk4/4
% p44=r0-r44
% c44=(4*rk4-7*r0)/9
% 
% %ZnGa2O4
% rk5=-12.51;
% r55=rk5/2
% p55=r0-r55
% c55=rk5-r0
%Calculating the deltaMU of Binaries:
mu1=r1/2;
mu2=r2/2;
mu3=r3;
%Calculating the Projecting points on the 3d Surface:
p1=r0-mu1;
p2=r0-mu2;
p3=r0-mu3;
%Calculating the cross points: 
%THIS equation changes for different K and N, EX: InGaZn'K'O'N'
c1=(4*r1-3*r0)/5
c2=(4*r2-3*r0)/5
c3=(4*r3-r0)/3


%R2O3 Plane
x = [0 p1 0];
y = [p1 0 0];
z = [mu1 mu1 c1];

%MO plane
x2 = [p3 0 0];
y2 = [mu3 mu3 c3];
z2 = [0 p3 0];

%A2O3 Plane
x3 = [mu2 mu2 c2];
y3 = [p2 0 0];
z3 = [0 p2 0];

%k=n planes
% x22 = [p22 0 0];
% y22 = [r22 r22 c22];
% z22 = [0 p22 0];
% 
% x33 = [p33 0 0];
% y33 = [r33 r33 c33];
% z33 = [0 p33 0];
% 
% x44 = [p44 0 0];
% y44 = [r44 r44 c44];
% z44 = [0 p44 0];
% 
% 
% %ZnGa2O4 Plane
% x55 = [r55 r55 c55];
% y55 = [p55 0 0];
% z55 = [0 p55 0];

% x3 = [mu2 mu2 0];
% y3 = [p2 0 c2];
% z3 = [0 p2 0];
%111 Plane
x4 = [0 0 r0];
y4 = [0 r0 0];
z4 = [r0 0 0];

x5 = [0 0 pres1];
y5 = [0 pres1 0];
z5 = [pres1 0 0];

x6 = [0 0 pres2];
y6 = [0 pres2 0];
z6 = [pres2 0 0];


%Base Points
A1=[0 p1 mu1];
A2=[p1 0 mu1];

B1=[p3 mu3 0];
B2=[0 mu3 p3];

C11=[mu2 p2 0];
C22=[mu2 0 p2];
 
  %Finding the base triangle
%   base1 = [A2(:) - A1(:),-(B2(:)-B1(:))]\(B1(:) - A1(:))
%   ans1=A1 + (A2 - A1)*base1(1)
%   base2 = [A2(:) - A1(:),-(C22(:)-C11(:))]\(C11(:) - A1(:))
%   ans2=C11 + (C22 - C11)*base2(1)
%   base3 = [B2(:) - B1(:),-(C22(:)-C11(:))]\(C11(:) - B1(:))
%   ans3=B1 + (B2 - B1)*base3(1)
% % top1 = [-.8 0 0];
% top2 = [0 -.8 0];
% top3 = [0 -.8 0];

%PLOTTING
view(147,37);
axis equal
axis([r0  0, r0 0, r0 0])
%Some extra junk
hold on;  % Very important that this is to be kept ON

R2O3=fill3(x,y,z, 'm');
 MO=fill3(x2,y2,z2, 'g');
A2O3=fill3(x3,y3,z3, 'b');

Base=fill3(x4,y4,z4,'c');

Orich=fill3(x5,y5,z5,'g');
Opoor=fill3(x6,y6,z6,'y');
%plots the other phases
% K2=fill3(x22,y22,z22, 'g');
% K3=fill3(x33,y33,z33, 'g');
% K4=fill3(x44,y44,z44, 'g');
% M2=fill3(x55,y55,z55, 'b');


% cc=fill3([-8.2,-4.1,-4.1],[-1.7,-5.79,-1.7],[-4.08,-4.1,-8.18],'c');
% bottom=fill3([ans1(1),ans2(1),ans3(1)],[ans1(2),ans2(2),ans3(2)],[ans1(3),ans2(3),ans3(3)],'r')
% % 
%  side1=fill3([top1(1),ans2(1),ans3(1)],[top1(2),ans2(2),ans3(2)],[top1(3),ans2(3),ans3(3)],'r')
%    side2=fill3([ans1(1),top2(3),ans3(1)],[ans1(2),top2(3),ans3(2)],[ans1(3),top2(3),ans3(3)],'r')
%    side3=fill3([ans1(1),ans2(1),top3(1)],[ans1(2),ans2(2),top3(2)],[ans1(3),ans2(3),top3(3)],'r')


 
xlabel('Ga')
ylabel('Zn')
zlabel('In')
grid on
box on 
alpha(Base,0.1)  % Controls the transparency of the 111 plane
% alpha(A2O3,0.3)
% alpha(R2O3,0.3)
% alpha(MO,0.3)

% alpha(A2O3,0.3)
alpha(Orich,0.5)
alpha(Opoor,0.5)

% alpha(K2,0.2) 
% alpha(K3,0.4) 
% alpha(K4,0.6) 
% alpha(M2,0.3) 
