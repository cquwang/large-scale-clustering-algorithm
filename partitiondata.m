function [labels,centers,radius] = partitiondata(data)
% partition a data into portions based on k-means++
%Input: 
%   data: a dataset
%Output:
%   labels: labels of each record
%   centers: centers of each clusters
%   sumd: within-cluster sums of point-to-centroid distances in the 1-by-K vector
% Author: Renmin Wang
%date:  2019.11.28
%E-mail: wangrenmin@cqu.edu.cn

%% initial data
data = data(:,1:end-1);
[r,~] = size(data);
k = round(sqrt(r)); % the number of portions, that is the paramter of k-means
radius = zeros(k,1);
%% partition data into k portions by calling kmeans
if k > 50 
    k = 50;
end
tic
[labels,centers,~,sumd,~] = litekmeans(data,k);
toc
%% mean distance between centers and respective clusters
for i = 1:k
   radius(i) = sumd(i) / numel(find(labels == i));
%     object_in_cluster = data(labels == i,1:2);
%     dis_vector = pdist2(centers(i,:),object_in_cluster);
%     radius(i) = max(dis_vector);
end
clear sumd
%%show result
plot_result(data,labels,centers)
end