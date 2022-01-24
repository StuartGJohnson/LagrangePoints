function [x, y, f_x, f_y, f_amp] = plot_force(r0, r1, n, r_range, n_contours)
% compute and plot the force on a massless particle in uniform cicular motion
% in the gravity field of two orbiting masses (i.e. orbiting about the COM 
% just as the two masses are.
% sample the area from -rmax:rmax with n x n points
rdiffx = r_range(2)-r_range(1);
rdiffy = r_range(4)-r_range(3);
dr_meshx = rdiffx/(n-1);
dr_meshy = rdiffy/(n-1);
x_sample = r_range(1):dr_meshx:r_range(2);
y_sample = r_range(3):dr_meshy:r_range(4);
[x, y] = meshgrid(x_sample, y_sample);
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
% return m0-centric coordinates/plot
x = x + r0;
contour(x,y,log10(f_amp), n_contours);
end