function [x, y, f_x, f_y, f_amp] = plot_force(r0, r1, n, rmax)
% compute and plot the force on a massless particle in uniform cicular motion
% in the gravity field of two orbiting masses (i.e. orbiting about the COM 
% just as the two masses are.
% sample the area from -rmax:rmax with n x n points
dr_mesh = (2*rmax)/(n-1);
[x, y] = meshgrid(-rmax:dr_mesh:rmax, -rmax:dr_mesh:rmax);
r0_x = -ones(size(x))*r0;
r0_y = zeros(size(y));
r1_x = ones(size(x))*r1;
r1_y = zeros(size(y));
r_r0_x = x - r0_x;
r_r0_y = y - r0_y;
r_r1_x = x - r1_x;
r_r1_y = y - r1_y;
denom_0 = sqrt(r_r0_x.*r_r0_x + r_r0_y.*r_r0_y);
denom_0 = denom_0.*denom_0.*denom_0;
denom_1 = sqrt(r_r1_x.*r_r1_x + r_r1_y.*r_r1_y);
denom_1 = denom_1.*denom_1.*denom_1;
f_x = x - r1*(r0+r1)^2 * r_r0_x ./denom_0 - r0*(r0+r1)^2 * r_r1_x ./ denom_1;
f_y = y - r1*(r0+r1)^2 * r_r0_y ./denom_0 - r0*(r0+r1)^2 * r_r1_y ./ denom_1;
f_amp = sqrt(f_x.*f_x + f_y.*f_y);
contour(x,y,log(f_amp));
end