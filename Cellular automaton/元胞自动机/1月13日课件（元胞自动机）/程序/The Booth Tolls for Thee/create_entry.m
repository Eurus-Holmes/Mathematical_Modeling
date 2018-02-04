function entry = create_entry(T,L)
k = linspace(0,T,34560);
a0 = 41.68;
entry = a0.*ones(size(k));
a = [-16.38, -18.59, 3.572, 7.876, -.5048, -2.97, 0.2518, 0.5785];
b = [12.53, 0.6307, -13.67, 0.4378, 6.93, 0.4869, -1.554, -0.5871];
omega = 0.2513;
for n = 1:8
entry = entry + a(n).*cos(n.*k.*omega) + b(n).*sin(n.*k.*omega);
end
k = k.*1440;
entry = entry./24.*3;
entry = round(entry);
%%% FOR RUSH HOUR SIMULATION %%%
% k = linspace(0,T,T.*60.*24);
% entry = zeros(size(k));
% entry(1:2:length(k)) = L;