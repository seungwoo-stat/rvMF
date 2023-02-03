// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// rvMF64
NumericVector rvMF64(int n, int p, double kappa, double log_const);
RcppExport SEXP _rvMF_rvMF64(SEXP nSEXP, SEXP pSEXP, SEXP kappaSEXP, SEXP log_constSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< int >::type n(nSEXP);
    Rcpp::traits::input_parameter< int >::type p(pSEXP);
    Rcpp::traits::input_parameter< double >::type kappa(kappaSEXP);
    Rcpp::traits::input_parameter< double >::type log_const(log_constSEXP);
    rcpp_result_gen = Rcpp::wrap(rvMF64(n, p, kappa, log_const));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_rvMF_rvMF64", (DL_FUNC) &_rvMF_rvMF64, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_rvMF(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}