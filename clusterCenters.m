function subtrees = clusterCenters(s,t,ST)
% clusterCenters produces clusters with respect to centers according to
% break edgs
%Input:
%   s: front Nodes of breakedges
%   t: latter Nodes of breakedges
%   ST: MST of centers
%Output:
%   result: cluster result

% initial
%result = cell(numel(s) + 1); % the number of clusters is numel(s) + 1

% nodes of MST
[i,j] = find(ST);
%show MST
G = graph(i,j);
figure
plot(G);
% remove edges
G2 = rmedge(G,s,t); 
figure
plot(G2);
% get results
if isempty(s) % all centers belong to one cluster
    subtrees = 1;
else
    nodes = [s;t];
    k = numel(nodes);
    tempresult = cell(k,1);
    for count = 1:k
        tempresult{count} = sort(bfsearch(G2,nodes(count)));
    end
    %remove duplicates
    [~,k] = unique(cellfun(@char,cellfun(@getByteStreamFromArray,tempresult,'un',0),'un',0));
    subtrees = tempresult(k);
end
end