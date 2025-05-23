function summary_table = plot_and_collect(m0_over_m1, str0, str1, note, ncontours, xy_range, enforce_range)
% for a mass ratio m0/m1, call various functions to make plots and compute
% Lagrange points for the two body system with named bodies m0(str0) and
% m1(str1). Collect computed Lagrange points into 2 cell array rows for
% inclusion in a summary table.
str_pair = [str0 '-' str1];
if isempty(note)
    fname = str_pair;
else
    fname = [str_pair '_' note];
end
m0_over_m1_p1 = m0_over_m1 + 1;
r0= 1/m0_over_m1_p1; r1 = m0_over_m1/m0_over_m1_p1;
[xz,yz]=solve_force(r0,r1);
% in m0-centric coordinates, these points are (x):
xz = xz + r0
summary_table=cell(2,8);
summary_table{1,1} = str_pair;
summary_table{2,1} = str_pair;
summary_table{1,2} = m0_over_m1;
summary_table{2,2} = m0_over_m1;
summary_table{1,3} = 'x';
summary_table{2,3} = 'y';
for j=1:length(xz)
    % grr ... cell arrays!
    summary_table{1,3+j} = xz(j);
    summary_table{2,3+j} = yz(j);
end
figure();[x, y, fx, fy, f]=plot_force(r0, r1, 1000, xy_range, ncontours);
% plot limits can get a little erratic when trying to plot small subranges
% of the main data set. For example, when zooming in via xy_range, setting
% enforce_range to true seems to help.
if enforce_range
    axis(xy_range);
end
hold on
plot(xz,yz, 'r+', 'LineWidth', 2)
if enforce_range
    axis(xy_range);
else
    axis equal
end
grid
title_str = [str0 '($m_0$)-' str1 '($m_1$) Lagrange points ($m_0$/$m_1$ = ' num2str(m0_over_m1) ')'];
title(title_str, 'Interpreter', 'latex')
xlabel('normalized system $x$ ($r_0$ = (0,0), $r_1$ = (1,0)', 'Interpreter', 'latex')
ylabel('normalized system $y$', 'Interpreter', 'latex')
legend({'contours of $\log{|\vec{f}|}$', 'zeros of $\vec{f}$'}, 'Interpreter', 'latex')
print(fname,'-dpng')
return
