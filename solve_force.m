function [x, y] = solve_force(r0, r1)
% solve for stationary points of the force on a masless particle
% in uniform circular motion about the center of mass of the two-
% particle system at [-r0, 0], [r1, 0] at t=0. 
R = r0+r1; R2 = R*R;
% solutions not on the x axis
x_plus_minus = -r0+R/2;
y_plus = sind(60)*R;
y_minus = -y_plus;
% solutions on the x axis
eps_root = 1000*double(eps('single'));
% we have roots between and on either side of our 2-body system
% these are numbered by the lagrange point index
root_interval3 = [-3*R -r0-eps_root];
x3 = fzero(@fx, root_interval3);
root_interval1 = [-r0+eps_root r1-eps_root];
x1 = fzero(@fx, root_interval1);
root_interval2 = [r1+eps_root 3*R];
x2 = fzero(@fx, root_interval2);
% pile up these estimates, in order of their lagrange index
x = [x1 x2 x3 x_plus_minus x_plus_minus];
y = [0 0 0 y_plus y_minus];

function f = fx(x)
    d0 = abs(x + r0); d0_3 = d0*d0*d0;
    d1 = abs(x - r1); d1_3 = d1*d1*d1;
    f = x - r1*R2*(x+r0)/d0_3 - r0*R2*(x-r1)/d1_3;
end

end