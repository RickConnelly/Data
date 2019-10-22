// I pulled school district poverty data from the U.S. Census for both school years (2016-2017 2017-2018) Direct link to page where data was used can be found here:
// https://www.census.gov/data/datasets/2016/demo/saipe/2016-school-districts.html //
// https://www.census.gov/data/datasets/2017/demo/saipe/2017-school-districts.html //


use "https://github.com/RickConnelly/Data/blob/master/NJ_Poverty_2016_17.dta?raw=true", clear

keep if Tablewithcolumnheadersinrow == "NJ" //Only keeps observations that are NJ School Districts //
drop Tablewithcolumnheadersinrow // Drops the name of the state, which is unncessary because we're only working with school districts in New Jersey, and we've already kept all NJ school districts in data set //
drop B // Drops Postal Code, unncessary since cannot merge on this //
drop C // Drops District ID, these District IDs do not match ones in data set, so we cannot merge on them, so we'll drop them

ren D DistrictName // Renames variable to DistrictName //
ren E TotalPop2016_17 // Renames variable to the total population of the school district in the 2017-2018 school year //
ren F TotalStudentPop2016_17 //Renames varialbe to the total population of students in each school district //
ren G PovertyStudentPop2016_17 // Renames variable to the population of students per school district that live in poverty //

save NJ_Poverty_2016_17, replace

use "https://github.com/RickConnelly/Data/blob/master/NJ_Poverty_2017_18.dta?raw=true", clear

keep if Tablewithcolumnheadersinrow == "NJ" //Only keeps observations that are NJ School Districts //
drop Tablewithcolumnheadersinrow // Drops the name of the state, which is unncessary because we're only working with school districts in New Jersey, and we've already kept all NJ school districts in data set //
drop B // Drops Postal Code, unncessary since cannot merge on this //
drop C // Drops District ID, these District IDs do not match ones in data set, so we cannot merge on them, so we'll drop them

ren D DistrictName // Renames variable to DistrictName //
ren E TotalPop2017_18 // Renames variable to the total population of the school district in the 2017-2018 school year //
ren F TotalStudentPop2017_18 //Renames varialbe to the total population of students in each school district //
ren G PovertyStudentPop2017_18 // Renames variable to the population of students per school district that live in poverty //

save NJ_Poverty_2017_18, replace

use NJ_Poverty_2017_18, clear
merge 1:1 DistrictName using NJ_Poverty_2016_17