library(tidyverse)
library(gtsummary)
library(dplyr)

here::i_am(
  "code/01_table_output.R"
)

data <- read.csv(here::here("fetal_health.csv"))

#Modifying numeric health variable to categorical variable
data_tri <- data %>%
  mutate(
    fetalHealth = factor(
      fetal_health,
      levels = c(1, 2, 3),
      labels = c("Normal", "Suspect", "Pathological")
    )
  ) %>%
  mutate(
    across(
      where(is.integer) & !all_of("fetalHealth"),
      ~ factor(.x, ordered = TRUE)
    )
  )

Figure1 <- ggplot(data_tri,
                  aes(x = baseline.value,
                      y = fetal_movement,
                      color = factor(fetalHealth),
                      alpha = factor(fetalHealth)
                  )) +
  geom_point() +
  scale_alpha_manual(values = c(
    "Normal" = 0.3, #lightest
    "Suspect" = 0.6, #moderate
    "Pathological" = 1.0 #darkest
  )) +
  labs(
    title = "Fetal Heartrate and Movement by Health",
    x = "Fetal Heartrate",
    y = "Number of Fetal Movements per Second",
    color = "Health",
    alpha = "Health"
  )

saveRDS(
  Figure1,
  file = here::here("output/scatterplot.rds")
)