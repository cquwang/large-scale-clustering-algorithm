function [s,t] = threepoint_rule(data,centers,ST,labels)
% three point decsion method, which determines which edges need to be
% disconnected
%Input:
%   data: data matrix
%   centers: coordinates of centers
%   ST: MST of centers
%   dm: distance matrix of distances from each point to every centroid
%   radius: radius of each cluster
%   dc: cut off of density
%   labels: intial result of litekmeans
%Output:
%   s: front points
%   t: latter points

%% initial 
[i,j,k] = find(ST);
[n,c] = size(centers);
s = [];
t = [];
three_points = zeros(n-1,c);
% % densities of centers
% den_centers = zeros(n,1);
% % densities of three_points
% den_three = zeros(n-1,1);
%% compute the three_points
for count = 1:n-1
    three_points(count,:) = (centers(i(count),:) + centers(j(count),:)) / 2;
end
%% compute densities of centers and the_third_points
m = 0;
for den_count = 1:n-1
    dc = k(den_count) / 4; % cut off distance
    label_i = find(labels == i(den_count)); % records of cluster i(x)
    label_j = find(labels == j(den_count)); % records of cluter j(x)
    
    distance_i = pdist2(data(label_i,1:end-1),centers(i(den_count),:)); % distance vector of records to its centroid
    distance_j = pdist2(data(label_j,1:end-1),centers(j(den_count),:));
    % distance of the three point to points in i and j
    X = three_points(den_count,:);
    Y = data([label_i;label_j],1:end-1);
    distance_ij = pdist2(X,Y);
    
    den_centers_i = sum(distance_i <= dc);
    den_centers_j = sum(distance_j <= dc);
    den_ij = sum(distance_ij <= dc);
    
    if den_ij < (den_centers_i + den_centers_j) / 6
        m = m +1;
        s(m) = i(den_count);
        t(m) = j(den_count);
    end   
    clear distance_i distance_j distance_ij
end
clear DM three_points
end