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

Table1 <- data_tri %>%
  select(fetalHealth,
         baseline.value,
         fetal_movement,
         uterine_contractions,
         abnormal_short_term_variability
  ) %>%
  tbl_summary(
    by = fetalHealth,
    statistic = all_continuous() ~ "{mean} ({sd})",
    digits = all_continuous() ~ 3,
    label = list(
      baseline.value ~ "Heart Rate",
      fetal_movement ~ "Movements per Sec",
      uterine_contractions ~ "Uterine Contractions per Sec",
      abnormal_short_term_variability ~ "Abnormal Short Term Variability"
    )
  ) %>%
  add_overall()

saveRDS(
  Table1,
  file = here::here("output/table.rds")
)