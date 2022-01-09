% explanatory script/figure and table generator
% calls the Lagrange point functions in this directory
%
% summary table of all lagrange points
summary_table = cell(8,7);
% earth-moon system
% the moon is about 1/81.3 times the mass of the earth. In normalized
% coordinates (earth-moon distance is 1.0):
% r0*m0 = r1*m1; r0+r1=1
% m0/m1 = 81.3, so...
r0= 1/82.3; r1 = 81.3/82.3;
[xz,yz]=solve_force(r0,r1);
% in m0-centric coordinates, these points are (x):
xz = xz + r0
table_row=1;
summary_table{table_row,1} = 'Earth-Moon';
summary_table{table_row+1,1} = '';
summary_table{table_row,2} = 'x';
summary_table{table_row+1,2} = 'y';
for j=1:length(xz)
    % grr ... cell arrays!
    summary_table{table_row,2+j} = xz(j);
    summary_table{table_row+1,2+j} = yz(j);
end
figure();[x,y,fx,fy,f]=plot_force(r0,r1,1000,[-1.8 1.8 -1.8 1.8]);
hold on
plot(xz,yz, 'r+')
axis equal
grid
title('Earth(m0)-Moon(m1) Lagrange points (m0/m1 = 81.3)')
xlabel('normalized system x (x0 = 0, x1 = 1)')
ylabel('normalized system y (y0 = 0, y1 = 0)')
legend({'contours of $\log{|\vec{f}|}$', 'zeros of $\vec{f}$'}, 'Interpreter', 'latex')
print -dpng earth_moon.png

% sun-earth is:
% r0*m0 = r1*m1; r0+r1=1
% m0/m1 = 330000, so...
r0= 1/330001; r1 = 330000/330001;
[xz,yz]=solve_force(r0,r1);
% in m0-centric coordinates, these points are (x):
xz = xz + r0
table_row=3;
summary_table{table_row,1} = 'Sun-Earth';
summary_table{table_row+1,1} = '';
summary_table{table_row,2} = 'x';
summary_table{table_row+1,2} = 'y';
for j=1:length(xz)
    % grr ... cell arrays!
    summary_table{table_row,2+j} = xz(j);
    summary_table{table_row+1,2+j} = yz(j);
end
figure();[x,y,fx,fy,f]=plot_force(r0,r1,1000,[-1.8 1.8 -1.8 1.8]);
hold on
plot(xz,yz, 'r+')
axis equal
grid
title('Sun(m0)-Earth(m1) Lagrange points (m0/m1 = 330000)')
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
title('Sun(m0)-Earth(m1) Lagrange points (m0/m1 = 330000)')
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
table_row=5;
summary_table{table_row,1} = 'Fict. 1';
summary_table{table_row+1,1} = '';
summary_table{table_row,2} = 'x';
summary_table{table_row+1,2} = 'y';
for j=1:length(xz)
    % grr ... cell arrays!
    summary_table{table_row,2+j} = xz(j);
    summary_table{table_row+1,2+j} = yz(j);
end
figure();[x,y,fx,fy,f]=plot_force(r0,r1,1000,[-1.8 1.8 -1.8 1.8]);
hold on
plot(xz,yz, 'r+')
axis equal
grid
title('Fictitious system 1 Lagrange points (m0/m1 = 5)')
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
table_row=7;
summary_table{table_row,1} = 'Fict. 2';
summary_table{table_row+1,1} = '';
summary_table{table_row,2} = 'x';
summary_table{table_row+1,2} = 'y';
for j=1:length(xz)
    % grr ... cell arrays!
    summary_table{table_row,2+j} = xz(j);
    summary_table{table_row+1,2+j} = yz(j);
end
figure();[x,y,fx,fy,f]=plot_force(r0,r1,1000,[-1.8 1.8 -1.8 1.8]);
hold on
plot(xz,yz, 'r+')
axis equal
grid
title('Fictitious system 2 Lagrange points (m0/m1 = 1)')
xlabel('normalized system x (x0 = 0, x1 = 1)')
ylabel('normalized system y (y0 = 0, y1 = 0)')
legend({'contours of $\log{|\vec{f}|}$', 'zeros of $\vec{f}$'}, 'Interpreter', 'latex')
print -dpng fict2.png

% and the summary table
HTMLtable(summary_table,'ShowOutput',true,'ColumnNames',{'system','coord','L1','L2','L3','L4','L5'},'OutputToFile',true,'FileName','lagrange_table');

