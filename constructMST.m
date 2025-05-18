function ST = constructMST(centers,radius)
% constructMST(centers) is used to construct MST graph based on centers of
% initial clusters
%
% Input: 
%   centers: centers of initial clusters
%   radius:influence radius of each center
%Output:
%   ST: MST
%   D; distance matrix of centers

%compute distance of centers
D = pdist2(centers,centers);
% sparsing
D = sparse(D');
% MST
[ST,~] = graphminspantree(D,'METHOD','Prim');
clear D
% show result
[i,j] = find(ST);

figure 
scatter(centers(:,1),centers(:,2),'^','filled','r');
% show range of influence of each center
for count = 1:numel(centers(:,1))
  rectangle('Position',[centers(count,1)-radius(count),centers(count,2)-radius(count),2 * radius(count),2 * radius(count)],'Curvature',[1,1],'LineStyle','--','EdgeColor','c'), axis equal  
end
hold on
for count = 1:numel(i)   
    plot([centers(i(count),1),centers(j(count),1)],[centers(i(count),2),centers(j(count),2)],'-.b','markersize',15);   
    text(centers(count,1) + 0.1,centers(count,2)+0.1,num2str(count),'fontsize',10);
    text(centers(count,1) + 0.1,centers(count,2)+0.1,num2str(count),'fontsize',10);
    hold on
end
hold off

%view(biograph(ST,[],'ShowArrows','off','ShowWeights','on'));
 
end