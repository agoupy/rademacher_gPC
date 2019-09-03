%% Compute the Rademacher complexity for a set of polynomials
%% set the sample
for n=[ 50 100 200 500]
d=1;

complexity=NaN(1,10);

P_max=30;
parfor_progress(P_max);
parfor order_max=1:P_max
    type='hermite-prob-norm';
    
    N_MC_sample=1000;
    r_emp=NaN(1,N_MC_sample);
    for i_MC_sample=1:N_MC_sample
        points=randn(n,d);
        %% compute empirical Rademacher complexity
        N_MC_sigma=100;
        sup=NaN(1,N_MC_sigma);
        for i_MC_sigma=1:N_MC_sigma
            sup(1,i_MC_sigma) = compute_sup (points, order_max, type);
        end
        r_emp(1,i_MC_sample)=mean(sup);
    end
    
    complexity(1,order_max)=mean(r_emp);
    parfor_progress;
end
parfor_progress(0);

disp(['n = ' num2str(n)])

filename=['complexity_n' num2str(n) '.txt'];
save(filename,'complexity','-ascii');
end 
