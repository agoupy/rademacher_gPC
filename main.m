%% Compute the Rademacher complexity for a set of polynomials
%% set the sample
n=50;
d=2;

complexity=NaN(1,10);
for order_max=5:2:11
type='hermite-prob-norm';

N_MC_sample=10;
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
end