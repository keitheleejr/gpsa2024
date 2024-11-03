data <- read_dta("../data/data.dta") |> # comment out if not using bvts.qmd
# data <- read_dta("data/data.dta") |> # comment out if using bvts.qmd
filter(
  !is.na(year),
  year >= 2000,
  year < 2020,
  country_id != 32 # South Sudan only has data from 2011 - 2019
) |>
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
  v2smgovsmmon_osp,
  v2smgovsm_osp,
  v2smgovshut_osp,
  v2smgovsmalt_osp,
  v2smregapp_osp,
  v2smregcap_osp,
  v2smregcon_osp,
  v2smgovfilprc_osp,
  v2smgovcapsec_osp,
  v2smgovsmcenprc_osp,
  v2smmefra_osp,
  v2smorgviol_osp,
  v2smorgavgact_osp,
  v2smorgelitact_osp,
  v2smfordom_osp,
  wdi_gdpcapcon2015,
  wdi_gdpgr,
  wdi_inflation,
  wdi_popden,
  wdi_popgr,
  wdi_trade,
  cyberattacks_recode,
  v2clrelig,
  v2smpolsoc_osp
) |>
mutate(
  log_ter_dom_pcap = log(ter_dom_pcap),
  log_ter_dom_pcap = ifelse(is.infinite(log_ter_dom_pcap), NA, log_ter_dom_pcap),
  log_ter_pcap = log(ter_pcap),
  log_ter_pcap = ifelse(is.infinite(log_ter_pcap), NA, log_ter_pcap)
)
