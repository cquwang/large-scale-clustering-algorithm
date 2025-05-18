function plot_result(A,result,centers)
%绘制聚类结果
%Input:
%   A:数据集
%   result:聚类结果


%将原数据标签替换为结果标签
%centers = A(icl,:); % 非代表点方法
%centers = lmst_centers(icl,:); %代表点方法
figure
i = 1;
%数据集中的簇
while 1
    rows = find(result == i);
    if isempty(rows)
        break ;
    else
        scatter(A(rows,1),A(rows,2),'.');
        i = i + 1;
        hold on;
    end
end
%中心点
if ~isempty(centers)
    %scatter(A(centers,1),A(centers,2),45,'p','r','filled');
    scatter(centers(:,1),centers(:,2),45,'^','filled','r');
end
hold off
end