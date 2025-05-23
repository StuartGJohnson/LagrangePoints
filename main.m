% explanatory script/figure and table generator
% calls the Lagrange point functions in this directory
%
% summary table of all lagrange points
summary_table = {};
ncontours=25;
std_range = [-1.8 1.8 -1.8 1.8];
% earth-moon system
% the moon is about 1/81.3 times the mass of the earth. In normalized
% coordinates (earth-moon distance is 1.0):
% r0*m0 = r1*m1; r0+r1=1
% m0/m1 = 81.3, so...
st_chunk = plot_and_collect(81.3, 'Earth', 'Moon', '', ncontours, std_range, false);
summary_table = vertcat(summary_table, st_chunk);

% sun-earth is:
% r0*m0 = r1*m1; r0+r1=1
% m0/m1 = 330000, so...
st_chunk = plot_and_collect(330000, 'Sun', 'Earth', '', ncontours, std_range, false);
summary_table = vertcat(summary_table, st_chunk);

% and a zoom
st_chunk = plot_and_collect(330000, 'Sun', 'Earth', 'zoom', ncontours, [0.98 1.02 -0.02 0.02], true);

% bogus system 1;
% mo/m1 = 5, so...
st_chunk = plot_and_collect(5, 'm0', 'm1', 'mr5', ncontours, std_range, false);
summary_table = vertcat(summary_table, st_chunk);

% bogus system 2;
% mo/m1 = 1, so...
st_chunk = plot_and_collect(1, 'm0', 'm1', 'mr1', ncontours, std_range, false);
summary_table = vertcat(summary_table, st_chunk);


% and the summary table
my_table=cell2table(summary_table,'VariableNames',{'system', 'm0/m1', 'coord','L1','L2','L3','L4','L5'})
% this uses table2latex:
% ----------------------------------------------------------------------- %
%   Version: 1.1                                                          %
%   Author:  Victor Martinez Cagigal                                      %
%   Date:    09/10/2018                                                   %
%   E-mail:  vicmarcag (at) gmail (dot) com                               %
% ----------------------------------------------------------------------- %
table2latex(my_table,'latex_table');
%HTMLtable(summary_table,'ShowOutput',true,'ColumnNames',{'system', 'm0/m1', 'coord','L1','L2','L3','L4','L5'},'OutputToFile',true,'FileName','lagrange_table');

