# rvMF

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/rvMF)](https://CRAN.R-project.org/package=rvMF) [![CRAN_Downloads](https://cranlogs.r-pkg.org/badges/grand-total/rvMF)](https://CRAN.R-project.org/package=rvMF)

Fast Generation of von Mises-Fisher Distributed Pseudo-Random Vectors

Generates pseudo-random vectors that follow an arbitrary von Mises-Fisher distribution on a sphere. This method is fast and efficient when generating a large number of pseudo-random vectors. Functions to generate random variates and compute density for the distribution of an inner product between von Mises-Fisher random vector and its mean direction are also provided. Details are in Kang and Oh (2024).

Visit [this repo](https://github.com/seungwoo-stat/rvMF-paper) for code to reproduce the figures and tables from the paper Kang and Oh (2024).

### Installation

Version 0.0.8 of this package is available on [CRAN](https://cran.r-project.org/package=rvMF):

``` r
install.packages("rvMF")
library(rvMF)
```

To use the development version (0.0.8.9000) of this package:

``` r
devtools::install_github("seungwoo-stat/rvMF")
library(rvMF)
```

If error occurs during the installation, it may be related to the package `scModels` that our package depends on. Try installing `scModels` prior to the installation of `rvMF` by `install.packages("scModels")`. Also, check [this](https://github.com/fuchslab/scModels) page.

### Reference

-   Seungwoo Kang and Hee-Seok Oh. (2024) [Novel Sampling Method for the von Mises--Fisher Distribution](https://doi.org/10.1007/s11222-024-10419-3). *Statistics and Computing* **34**(3), 106.
