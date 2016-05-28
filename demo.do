//    Setup the ECSI mobi data (Tenenhaus et al 2005)
sysuse ecsimobi, clear
center _all, inplace standardize

//   Calculate the PLS composites
pls (Expectation = CUEX1-CUEX3) ///
            (Satisfaction = CUSA1-CUSA3) ///
            (Complaint = CUSCO) ///
            (Loyalty = CUSL1-CUSL3) ///
            (Image = IMAG1-IMAG5) ///
            (Quality = PERQ1-PERQ7) ///
            (Value = PERV1-PERV2), ///
            adjacent(Expectation Image, Quality Expectation, Value Expectation Quality, ///
            Satisfaction Value Quality Image Expectation, Complaint Satisfaction, Loyalty Complaint Satisfaction Image) ///
            scheme("centroid")

//    Regression between the composites
estimates clear

regress Expectation Image
estimates store Expectation

regress Quality Expectation
estimates store Quality

regress Value Expectation Quality
estimates store Value

regress Satisfaction Value Quality Image Expectation
estimates store Satisfaction

regress Complaint Satisfaction
estimates store Complaint

regress Loyalty Complaint Satisfaction Image
estimates store Loyalty

estimates table _all
