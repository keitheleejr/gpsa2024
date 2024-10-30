library(tidyverse)
library(haven)

data <- read_dta("data/data.dta") |> 
  select(
    country,
    country_text_id,
    country_id,
    year,
    historical_date,
    ter_total,
    ter_dom_tot,
    ter_pcap,
    ter_dom_pcap,
    v2smgovsmmon,
    v2smgovsm,
    v2smgovshut,
    v2smgovsmalt,
    v2smregapp,
    v2smregcap,
    v2smregcon,
    v2smgovfilprc,
    v2smgovcapsec,
    v2smgovsmcenprc,
    v2smmefra,
    v2smhargr_nr,
    v2smorgviol,
    v2smorgavgact,
    v2smorgelitact,
    v2smfordom,
    wdi_gdpcapcon2015,
    wdi_gdpgr,
    wdi_inflation,
    wdi_popden,
    wdi_popgr,
    wdi_trade,
    cyberattacks_recode,
    v2clrelig,
    v2cacamps
  ) |> 
  filter(
    !is.na(year),
    year >= 2000
  )
