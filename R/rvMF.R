Rcpp::sourceCpp("src/rvMF64.cpp")

#' Fast random vectors generator from a von Mises-Fisher distribution
#'
#' @param n number of random vectors to generate.
#' @param mu mean direction.
#' @param k concentration parameter. \eqn{k\ge 0}.
#' @return matrix where each row follows iid vMF distribution.
#' @examples
#' rvMF(1e5, c(0,0,1), 10)
#' rvMF(1e4, c(1,1)/sqrt(2), 0)
#' @export
rvMF <- function (n, mu, k)
{
  rotation <- function(a, b) {
    p <- length(a)
    ab <- sum(a * b)
    ca <- a - b * ab
    ca <- ca/sqrt(sum(ca^2))
    A <- b %*% t(ca)
    A <- A - t(A)
    theta <- acos(ab)
    diag(p) + sin(theta) * A + (cos(theta) - 1) * (b %*% t(b) + ca %*% t(ca))
  }
  d <- length(mu)
  if (k > 0) {
    mu <- mu/sqrt(sum(mu^2))
    ini <- c(numeric(d - 1), 1)
    d1 <- d - 1
    v1 <- Rfast::matrnorm(n, d1)
    v <- v1/sqrt(Rfast::rowsums(v1^2))
    w <- rvMF64(n,d,k,scModels::chf_1F1(2*k,d1/2,d1))
    S <- cbind(sqrt(1 - w^2) * v, w)
    if (isTRUE(all.equal(ini, mu, check.attributes = FALSE))) {
      x <- S
    }
    else if (isTRUE(all.equal(-ini, mu, check.attributes = FALSE))) {
      x <- -S
    }
    else {
      A <- rotation(ini, mu)
      x <- tcrossprod(S, A)
    }
  }
  else {
    x1 <- Rfast::matrnorm(n, d)
    x <- x1/sqrt(Rfast::rowsums(x1^2))
  }
  colnames(x) <- names(mu)
  x
}

#' Generate random variable following angle between vMF mean direction and random vector
#'
#' @param n number of random vectors to generate.
#' @param p dimension of the vMF distribution. i.e., vMF on \eqn{S^{p-1}}, \eqn{p\ge 2}.
#' @param kappa concentration parameter. \eqn{kappa\ge 0}.
#' @return vector where each component follows iid vMF angle distribution.
#' @examples
#' rvMFangle(1e5, 2, 10)
#' rvMFangle(1e4, 3, 0)
#' @export
rvMFangle <- function(n,p,kappa) rvMF64(n,p,kappa,scModels::chf_1F1(2*kappa,(p-1)/2,p-1))

#' Probability density function of angle between vMF mean direction and random vector
#'
#' @param r vector of quantiles. \eqn{-1\le r\le 1}.
#' @param p dimension of the vMF distribution. i.e., vMF on \eqn{S^{p-1}}, \eqn{p\ge 2}.
#' @param kappa concentration parameter. \eqn{kappa\ge 0}.
#' @return vector of density.
#' @examples
#' dvMFangle(seq(-1,1,by=0.01), 2, 10)
#' dvMFangle(seq(0,1,by=0.01), 3, 0)
#' @export
# S^(p-1)
dvMFangle <- function(r,p,kappa){
  nu <- p/2-1
  if(kappa == 0){
    return(exp((2-p)*log(2) + lgamma(p-1) - lgamma((2*nu+1)/2)*2 + (p-3)/2*log(1-r^2)))
  } else{
    if(Re(Bessel::BesselI(kappa,nu)) != Inf & Re(Bessel::BesselI(kappa,nu)) != 0){
      return(exp(nu*log(kappa/2) - 1/2*log(pi) - log(Re(Bessel::BesselI(kappa,nu))) - lgamma((2*nu+1)/2) +
                   (p-3)/2*log(1-r^2) + kappa*r))
    } else{ # more precision
      return(exp(nu*log(kappa/2) - 1/2*log(pi) - Bessel::besselI.nuAsym(kappa,nu, k.max=5, expon.scaled = T, log = T) - kappa -
                   lgamma((2*nu+1)/2) + (p-3)/2*log(1-r^2) + kappa*r))
    }
  }
}
