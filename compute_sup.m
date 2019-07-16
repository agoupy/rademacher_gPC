function [sup] = compute_sup (points, order_max, type)

% generate polynomials on sample
[Nq,dim]=size(points);
He=poly1D(order_max,type);
alpha=multi_index(dim,order_max);
P_max=size(alpha,1);
pol=ones(Nq,P_max);
for i=1:P_max
    %polynomial evaluation
    for j=1:dim
        pol(:,i)=polyval(He{alpha(i,j)+1},points(:,j)).*pol(:,i);
    end
end


sig= (rand(Nq,1)<.5) - .5; %rademacher rv
sums=NaN(1,P_max);
%find the supremum
for i_f=1:P_max
  sums(1,i_f)=sum(pol(:,i_f).*sig);
end
sup=max(sums)/Nq;


endfunction
