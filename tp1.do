clear all
set more off

cd "D:\Santiago\Documents\Facultade\2021 4to año\Economia internacional\tp1"
use "Datos TP1.dta",clear

*Genero logaritmos
foreach var of varlist vx dist gdp_e gdp_i{
    drop if `var'==0
    gen log`var'=log(`var') 
}

preserve
drop if us==1
regress logvx loggdp_e loggdp_i logdist can
restore

preserve
drop if can==1
regress logvx loggdp_e loggdp_i logdist us
restore

regress logvx loggdp_e loggdp_i logdist can us
display "papa"