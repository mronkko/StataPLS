{smcl}
{* *! version 1.0  29oct2015}{...}

{cmd:help pls}
{hline}

{title:Title}

{phang}
{bf:pls} {hline 2} calculates composite variables using the partial least squares path modeling (PLS) algorithm


{marker syntax}{...}
{title:Syntax}

{p 8 14 2}
{cmd:pls} {cmd:(}{newvar:1} = {varlist:1}{cmd:)}
{cmd:(}{newvar:2} = {varlist:2}{cmd:)} 
{it:...} {cmd:(}{newvar:N} = {varlist:N}{cmd:)} {ifin}
[, {it:options}]

{synoptset 50 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Options}
{synopt:{cmdab:a:djacent(}{varlist:1} [, {varlist:2}, {it:...}, {varlist:N}])}defines which composites are adjacent to each other{p_end}
{synopt:{opt m:odeB}({varlist})}sets Mode B outer estimation{p_end}
{synopt:{opt s:cheme(scheme)}}sets innner estimation scheme{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}
{cmd:by} is allowed; see {manhelp by D}.{p_end}

{marker description}{...}
{title:Description}

{pstd}
{cmd:pls} calculates composite variables using the partial least squares path 
modeling (PLS) algorithm. 

{pstd}
The composites are calculated as weighted combinations of existing variables 
using the weight algorithm introduced by Wold (see {help pls##wold1982:Wold (1982)}).
The composites produced by {cmd:pls} are identical to the composites produced by commercial
PLS software as well as the open source 
{browse "https://cran.r-project.org/web/packages/matrixpls/index.html":matrixpls}
R package except for small numerical differences due to different convergence
criterion.

{marker options}{...}
{title:Options}

{dlgtab:Options}

{phang}
{cmd:adjacent(}{varlist:1} [, {varlist:2}, {it:...}, {varlist:N}]) defines which composites are adjacent to each other during inner
estimation. The first variable of varlist is defined as being adjacent to the
other variables. If the path scheme is used for inner estimation, the 
directionality of adjacencies is from the other variables toward the first
variable.

{phang}
{opt modeB}({varlist})}sets Mode B outer estimation for the composites in varlist. All other composites are calculated with Mode A outer estimation.

{phang}
{opt scheme(scheme)} sets innner estimation scheme. Valid values for scheme are centroid, factor, and path. The default is the centroid method.{p_end}

{marker remarks}{...}
{title:Remarks}

{phang}
This program is provided for educational purposes. It is difficult to recommend 
the PLS composites for any serious empirical work
(see {help pls##rma2015:R{char 154}nkk{char 154}, McIntosh, and Antonakis (2015)})

{phang}
{cmd:pls} is not an official Stata command. Please cite it as: 

{phang}R{char 154}nkk{char 154}, M. (2015) pls: Stata module to calculate PLS composites
https://github.com/mronkko/StataPLS


{marker examples}{...}
{title:Example}

{pstd}Setup{p_end}
{phang2}{cmd:. webuse sem_sm2}{p_end}

{pstd}Calculate PLS composites{p_end}
{phang2}{cmd:. pls (Alien67 = anomia67 pwless67)}{break}
{cmd:(Alien71 = anomia71 pwless71)}{break}
{cmd:(SES = educ66 occstat66),}{break}
{cmd:adjacent(Alien71 Alien67 SES, Alien67 SES)}{break}
{cmd:modeB(SES)}{break}
{cmd:scheme("path")}{break}

{pstd}Regression between composites{p_end}
{phang2}{cmd:. regress Alien67 SES}{p_end}
{phang2}{cmd:. regress Alien71 Alien67 SES}{p_end}

{marker references}{...}
{title:References}

{marker wold1982}{...}
{phang}
Wold, H. (1982). Soft modeling: The basic design and some extensions. 
In K. G. J{char 154}reskog & S. Wold (Eds.), {it:Systems under indirect observation?: causality, structure, prediction} (pp. 1-54). Amsterdam: North-Holland.

{marker rma2015}{...}
{phang}
R{char 154}nkk{char 154}, M., McIntosh, C. N., & Antonakis, J. (2015). On the adoption of partial least squares in psychological research: Caveat emptor. {it:Personality and Individual Differences}, (87), 76-84. 
{browse "http://doi.org/10.1016/j.paid.2015.07.019":DOI:10.1016/j.paid.2015.07.019}
{p_end}
