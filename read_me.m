% explanatory script of the lagrange point functions in this directory
% earth-moon system
% the moon is about 1/81.3 times the mass of the earth. In normalized
% coordinates (earth-moon distance is 1.0):
% r0*m0 = r1*m1; r0+r1=1
% m0/m1 = 81.3, so...
r0= 1/82.3; r1 = 81.3/82.3;
[xz,yz]=solve_force(r0,r1);
% in m0-centric coordinates, these points are (x):
xz = xz + r0
figure();[x,y,fx,fy,f]=plot_force(r0,r1,1000,[-1.8 1.8 -1.8 1.8]);
hold on
plot(xz,yz, 'r+')
axis equal
grid
title('earth(m0)-moon(m1) lagrange points (m0/m1 = 81.3)')
xlabel('normalized system x (x0 = 0, x1 = 1)')
ylabel('normalized system y (y0 = 0, y1 = 0)')
legend({'contours of $\log{|\vec{f}|}$', 'zeros of $\vec{f}$'}, 'Interpreter', 'latex')
print -dpng earth_moon.png

% sun-moon is:
% r0*m0 = r1*m1; r0+r1=1
% m0/m1 = 330000, so...
r0= 1/330001; r1 = 330000/330001;
[xz,yz]=solve_force(r0,r1);
% in m0-centric coordinates, these points are (x):
xz = xz + r0
figure();[x,y,fx,fy,f]=plot_force(r0,r1,1000,[-1.8 1.8 -1.8 1.8]);
hold on
plot(xz,yz, 'r+')
axis equal
grid
title('sun(m0)-earth(m1) lagrange points (m0/m1 = 330000)')
xlabel('normalized system x (x0 = 0, x1 = 1)')
ylabel('normalized system y (y0 = 0, y1 = 0)')
legend({'contours of $\log{|\vec{f}|}$', 'zeros of $\vec{f}$'}, 'Interpreter', 'latex')
print -dpng sun_earth.png
% and a zoom
figure();[x,y,fx,fy,f]=plot_force(r0,r1,500,[0.98 1.02 -0.02 0.02]);
hold on
axis([0.98 1.02 -0.02 0.02])
plot(xz,yz, 'r+')
axis([0.98 1.02 -0.02 0.02])
grid
title('sun(m0)-earth(m1) lagrange points (m0/m1 = 330000)')
xlabel('normalized system x (x0 = 0, x1 = 1)')
ylabel('normalized system y (y0 = 0, y1 = 0)')
legend({'contours of $\log{|\vec{f}|}$', 'zeros of $\vec{f}$'}, 'Interpreter', 'latex')
print -dpng sun_earth_zoom.png

% bogus system 1;
% mo/m1 = 5, so...
r0=1/6; r1=5/6;
[xz,yz]=solve_force(r0,r1);
% in m0-centric coordinates, these points are (x):
xz = xz + r0
figure();[x,y,fx,fy,f]=plot_force(r0,r1,1000,[-1.8 1.8 -1.8 1.8]);
hold on
plot(xz,yz, 'r+')
axis equal
grid
title('fictitious system 1 lagrange points (m0/m1 = 5)')
xlabel('normalized system x (x0 = 0, x1 = 1)')
ylabel('normalized system y (y0 = 0, y1 = 0)')
legend({'contours of $\log{|\vec{f}|}$', 'zeros of $\vec{f}$'}, 'Interpreter', 'latex')
print -dpng fict1.png

% bogus system 2;
% mo/m1 = 1, so...
r0=1/2; r1=1/2;
[xz,yz]=solve_force(r0,r1);
% in m0-centric coordinates, these points are (x):
xz = xz + r0
figure();[x,y,fx,fy,f]=plot_force(r0,r1,1000,[-1.8 1.8 -1.8 1.8]);
hold on
plot(xz,yz, 'r+')
axis equal
grid
title('fictitious system 2 lagrange points (m0/m1 = 1)')
xlabel('normalized system x (x0 = 0, x1 = 1)')
ylabel('normalized system y (y0 = 0, y1 = 0)')
legend({'contours of $\log{|\vec{f}|}$', 'zeros of $\vec{f}$'}, 'Interpreter', 'latex')
print -dpng fict2.png
