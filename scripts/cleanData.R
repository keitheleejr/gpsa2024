library(tidyverse)
library(haven)

data <- read_csv("data/data.csv") |>
  rename(
    socmedmonitor = v2smgovsmmon,
    socmedsd = v2smgovsm,
    govintsd = v2smgovshut,
    socmedalt = v2smgovsmalt,
    contentreg = v2smregapp,
    captoreg = v2smregcap,
    intlegreg = v2smregcon,
    intfilter = v2smgovfilprc,
    cybseccap = v2smgovcapsec,
    socmedcen = v2smgovsmcenprc,
    fraction = v2smmefra,
    harass = v2smhargr_nr,
    orgoffviol = v2smorgviol,
    avecituse = v2smorgavgact,
    eliteuse = v2smorgelitact,
    forgovdiss = v2smfordom,
    gdppc = wdi_gdpcapcon2015,
    gdpgr = wdi_gdpgr,
    inflation = wdi_inflation,
    popden = wdi_popden,
    popgr = wdi_popgr,
    trade = wdi_trade,
    cybatt = cyberattacks_recode,
    ffrel = v2clrelig,
    polar = v2cacamps
  )


write.csv(data,"data.csv", row.names = FALSE, na = "")
