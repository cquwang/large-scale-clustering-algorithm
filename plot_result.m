function plot_result(A,result,centers)
%���ƾ�����
%Input:
%   A:���ݼ�
%   result:������


%��ԭ���ݱ�ǩ�滻Ϊ�����ǩ
%centers = A(icl,:); % �Ǵ���㷽��
%centers = lmst_centers(icl,:); %����㷽��
figure
i = 1;
%���ݼ��еĴ�
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
%���ĵ�
if ~isempty(centers)
    %scatter(A(centers,1),A(centers,2),45,'p','r','filled');
    scatter(centers(:,1),centers(:,2),45,'^','filled','r');
end
hold off
end