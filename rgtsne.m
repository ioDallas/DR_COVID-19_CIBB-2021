function [dm3, dm1] = rgtsne(data1, rp_spaces, rp_dims, nn, dist_type = 'correlation')
% 
[nr, ncol] = size(data1);
dm = zeros(nr,nr);

tol = rp_spaces/10;

for i = 1:rp_spaces
    d1 = data1*rand(ncol,rp_dims);
    d = squareform(pdist(d1,dist_type));
    [~, ni] = sort(d,2);
    for j = 1:nr
        dm(j,ni(j, 1:nn)) = dm(j,ni(j, 1:nn))+1;
    end
end

dm1 = zeros(nr,nr);
for i = 1:nr
    for j = 1:nr
        if dm(i,j)~=0
           if dm(i,j)<tol
             dm1(i,j) = 0;
           else
             dm1(i,j) = 1/dm(i,j);
           end
        end
    end
end
dm1 = dm1 - diag(diag(dm1));



for i = 1:size(dist,1)
    for j = 1:size(dist,1)
        if isinf(dist(i,j))
            dist(i,j) = 5;
        end
    end
end
for i = 1:size(dist,1)
    for j = i
        dist(i,j) = 0;
    end
end


dm3 = dist;
for i = 1:size(dist,1)-1
    for j = i+1:size(dist,1)
        dm3(i,j) = (dm3(i,j)+dm3(j,1))/2;
        dm3(j,i) = dm3(i,j);
    end
end

end


% 
% Y = tsne(dm3);
% figure;
% gscatter(Y(:,1),Y(:,2),class)
% title('RGt-SNE')
