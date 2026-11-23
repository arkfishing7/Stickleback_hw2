#!/usr/bin/env Rscript
# Homework problem one

library(tidyr)
library(ggplot2)
library(dplyr)

setwd("~/alexhw1") #can we use it once?
data <- read.csv("./inputs/hydrogel/Hydrogel_BMP2_release.csv")
formulation <- factor(data$formulation)

output_dir <- "results/hydrogel/tables" 
summary_table <- data |>
    group_by(formulation) |>
     summarise(n = n(),
            mean = mean(diffusion_rate_ug_per_day),
            sd = sd(diffusion_rate_ug_per_day),
            median = median(diffusion_rate_ug_per_day),)
    write.csv(summary_table, file.path(output_dir, "diffusion_summary.csv"),  row.names = FALSE)

output_dir <- "results/hydrogel/figures" 

violin_plot <- data |>
  ggplot(aes(formulation, diffusion_rate_ug_per_day, fill = formulation)) +
  geom_violin(alpha = 0.4, color = NA, position = position_dodge(0.8), trim = FALSE) +
  geom_point(aes(color = formulation), alpha = 0.6, size = 2,
             position = position_jitterdodge(jitter.width = 0.1, dodge.width = 0.8)) +
  stat_summary(fun = median, geom = "point", size = 3, color = "black") +
  scale_fill_viridis_d(end = 0.7) + scale_color_viridis_d(end = 0.7) +
  labs(x = "Formulation", y = "BMP-2 diffusion rate (µg/day)",
       title = "Diffusion of hydrogel formulations",
       subtitle = "black point represents median diffusion rate")
  theme_minimal(base_size = 14) + theme(legend.position = "top") 
  ggsave(file.path(output_dir, "BMP-2_diffusion_rates.svg"), plot = violin_plot, width = 8, height = 6, dpi = 300)
