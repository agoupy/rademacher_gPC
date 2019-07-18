%% Compute the Rademacher complexity for a set of polynomials
%% set the sample
n=500;
d=1;

complexity=NaN(1,10);

P_max=30;
parfor_progress(P_max);
for order_max=1:P_max
    type='hermite-prob-norm';
    
    N_MC_sample=100;
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

fid =fopen('complexity_n50_p520.txt', 'w' );
fprintf(fid,'%f   ',complexity);

