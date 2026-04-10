## Cardiotocogram Analysis

The current repository generates a report, compiling Cardiotocogram data into
a descriptive table, as well as a scatterplot of fetal heart rate against 
movement.

The goal of the report is to illustrate descriptive statistic values associated 
with CTG Measurements and identify pathological clusters in order to identify 
key indicators.

## Initial Code Description

'code/01_table_output.R'

  - Generates table displaying, average Heart Rate, Fetal Movement, 
    Uterine Contractions, and Abnormal Short-Term CTG Variability
    by fetal health status
   
'code/02_scatterplot_output.R'

  - Generate scatterplot, displaying fetal heart rate against
    fetal movements per second by health status
   
'code/03_render_output.R'

  - Renders 'Edupuganti_550_final.Rmd'
  
'Makefile'

  - contains rules for building the report and cleaning project directory