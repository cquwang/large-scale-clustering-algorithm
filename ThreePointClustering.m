function [t,L] = ThreePointClustering(data)
% A fast cluster algorithm based on three point decision
% Input:
%   data: data records
%Output:
%   L: labels of final result

tic
%% partition data
[labels,centers,radius] = partitiondata(data);

%% MST based on centers
ST = constructMST(centers,radius);

%% Three point decsion
[s,t] = threepoint_rule(data,centers,ST,labels);

%% result after removing edges
subtrees = clusterCenters(s,t,ST);

%% final result
L = getresult(subtrees,labels);
toc
t = toc;
%% show result
figure
gscatter(data(:,1),data(:,2),L);
end