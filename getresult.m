function L = getresult(subtrees,labels)
%produce final result according to result of centers
%Input:
%   subtrees: cluster result after disconnecting edges
%   labels: labels produced by kmeans
%Output:
%   L: final labels of each data point


L = zeros(numel(labels),1);

if numel(subtrees) == 1 % only one cluster
    L(:) = 1;
else
    for count = 1:numel(subtrees)
        oneCluster = cell2mat(subtrees(count));
        [Lia,~] = ismember(labels,oneCluster);
        rows = find(Lia == 1);
        L(rows) = count;
    end
end

end