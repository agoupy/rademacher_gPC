# rademacher_gPC

## Aim of the code

Rademacher complexity has been introduced in the context of omputational learning theory. It aims to quantify the ability of an algorithm to learn from a set of data. 

In uncertainty quatification, the efficiency of a metamodel is often evaluated using error measures. The idea of this code is to compute the Rademacher complexity of Polynomial Chaos Expansion (PCE).

Rademacher complexity seems to be particularly well-suited for our application since it deals with a distribution-based sample and is defined for real-valued function and not only for classification problems.

## Rademacher complexity definition

The Rademacher complexity is defined as the expectation of the empirical Radmacher complexity ![f1] over all the possible sample ![f2] of size ![f3]:

<p align="center">
<img width="264" height="41" src="http://chart.apis.google.com/chart?cht=tx&chl=\hat{R}_m(\mathcal{F})=\mathbb{E}_\sigma\left[\sup_{f\in\mathcal{F}}\left(\sum_{i=1}^m\sigma_if(z_i)\right)\right]">
</p>

where ![f5] is the class of function (for us the polynomials family), and ![f6] are random variable which take value +1 and -1.

## Computation

In this code the sample ![f2] is supposed to be normally ditributed and ![f5] is the family of Hermite polynomials up to a certin degree.

The complexity is then computed for different degree and different sample size.

<p align="center">
  <img width="460" height="300" src="https://github.com/agoupy/rademacher_gPC/blob/master/complexities.png">
</p>

## Author

**Alexandre Goupy** - [agoupy](https://github.com/agoupy)


[f1]: http://chart.apis.google.com/chart?cht=tx&chl=\hat{R}_m
[f2]: http://chart.apis.google.com/chart?cht=tx&chl=\mathcal{S}
[f3]: http://chart.apis.google.com/chart?cht=tx&chl=m
[f4]: http://chart.apis.google.com/chart?cht=tx&chl=\hat{R}_m(\mathcal{F})=\mathbb{E}_\sigma\left[\sup_{f\in\mathcal{F}}\left(\sum_{i=1}^m\sigma_if(z_i)\right)\right]
[f5]: http://chart.apis.google.com/chart?cht=tx&chl=\mathcal{F}
[f6]: http://chart.apis.google.com/chart?cht=tx&chl=\sigma_i

 
