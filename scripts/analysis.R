source("scripts/libraries.R")
source("scripts/getData.R")
source("scripts/cleanData.R")


# Create a lagged instrument variable
data <- data |> 
  arrange(country_id, year) |>
  group_by(country_id) %>%
  mutate(
    lag_socmedmonitor = lag(socmedmonitor, 2),
    lag_socmedsd = lag(socmedsd, 2),
    lag_contentreg = lag(contentreg, 2),
    lag_intfilter = lag(intfilter, 2),
    lag_socmedcen = lag(socmedcen, 2),
    lag_captoreg = lag(captoreg, 1),
    lag_cybseccap = lag(cybseccap, 1)
  ) %>%
  ungroup()

# Fit the IV model using the lagged instrument variable

iv_model <- ivreg(
  ter_dom_pcap ~ lag_socmedcen + gdpgr + polar + avecituse + factor(year)| 
  lag_captoreg + lag_cybseccap + gdpgr + polar + avecituse + factor(year), data = data)
summary(iv_model)


library(pscl)

pscl <- data |> 
  filter(!is.na(ter_total))

zinb_model <- zeroinfl(
  ter_total ~ captoreg + gdpgr + polar + avecituse + factor(year), 
  data = pscl, dist = "negbin"
)
summary(zinb_model)

library(AER)
tobit_model <- tobit(ter_dom_pcap ~ captoreg + gdpgr + polar + factor(year), data = data)
summary(tobit_model)
