# GECCO2024
R script to reproduce the results and figures of the manuscript "The effects of shrub encroachment on arthropod communities depend on grazing history" published in Global Ecology and Conservation.
Feel free to reuse the code.


Reference:
Losapio, G., De Moraes, C.M., Nickels, V., Tscheulin, T., Zouros, N., Mescher, M.C. (2024) The effects of shrub encroachment on arthropod communities depend on grazing history. Global Ecology and Conservation, 50, e02819, 1–8.


Data are publicly available online at the ETH Research collection https://doi.org/10.3929/ethz-b-000311956

Citation for dataset: 
Losapio, G., De Moraes, C.M., Nickels, V., Tscheulin, T., Zouros, N., Mescher, M.C. (2018) Abundance and diversity data of arthropod community response to land-use change and species invasion. ETH Research Collection. https://doi.org/10.3929/ethz-b-000311956


R code is publicy available online in this GitHub project
https://github.com/losapio/GECCO2024

Citation for R code:
Gianalberto Losapio. (2024). The effects of shrub encroachment on arthropod communities depend on grazing history, GitHub [R code] (v1.0.0). Zenodo. https://doi.org/10.5281/zenodo.10682773

##########################################################################################################################


Summary table of arthropod communities is included here as arthropoda1.csv. In that file, there are the following columns (variables):

ID = pitfall sequential ID number

SITE = study site

LAND	= land managmenet treatment, either inside the protected areas or outside

ENCLOSURE	= grazing exclusion treatment: currently grazed, recently ungrazed, long-time ungrazed

PLOT	= plot number

BLOCK	= block number

REPLICATION	= time replicate

CLASS	= arthropod class name

ORDER	= artrhopod order name

FAMILY	= arthropod family name

INDIVIDUALS	= number of specimens

stage	= life-history stage

Notes

The second dataset art2.csv contains the summary table formatted for statistical analysis. In there, each row is a replicated experimental unit (i.e., one pitfall in each treatment combination in each sampling time).




