line_plot <- function(data, variable) {
  summarized_data <- data |> 
    filter(!is.na(.data[[variable]])) |> 
    group_by(year) |>  # Group by numeric year
    summarize(
      mean = mean(.data[[variable]], na.rm = TRUE),
      median = median(.data[[variable]], na.rm = TRUE)
    )
  
  ggplot(summarized_data) +
    geom_line(aes(x = factor(year), y = socmedalt, group = 1), color = "blue") + 
    geom_point(aes(x = factor(year), y = socmedalt), color = "blue") +
    geom_line(aes(x = factor(year), y = ter_dom_pcap, group = 1), color = "red") + 
    geom_point(aes(x = factor(year), y = ter_dom_pcap), color = "red") +
    labs(x = "Year", y = "Value", title = paste("Mean and Median of", variable, "by Year")) +
    scale_x_discrete(breaks = seq(1999, 2025, by = 5)) +
    theme_classic()
}

line_plot(data, "socmedalt")

line_plot(data, "socmedmonitor")

line_plot(data, "contentreg")

line_plot(data, "ter_dom_pcap")


plotdata <- data |> 
  group_by(year) |> 
  summarize(
    meansma = mean(socmedalt),
    meantdp = mean(ter_dom_pcap),
    meancr = mean(contentreg), 
    meansmm = mean(socmedmonitor)
  )



ggplot(plotdata) + 
  geom_line(aes(x = year, y = meansmm), group = 1, color = "blue") +
  scale_x_continuous(limits = c(2000,2020)) + 
  labs(x = "Year", y = "Mean") +
  theme_minimal()


