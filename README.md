## Cardiotocogram Analysis

The current repository generates a report, compiling Cardiotocogram data into
a descriptive table, as well as a scatterplot of fetal heart rate against 
movement.

The goal of the report is to illustrate descriptive statistic values associated 
with CTG Measurements and identify pathological clusters in order to identify 
key indicators.

## Build the report

  - After cloning the project repository, ensure your working directory is data550_final
  - In terminal type the `make docker_report` command to produce the final report in the final_report sub-folder
  
### Alternative
 
  - After cloning the project repository, ensure your working directory is data550_final
  - Run `make install` and then `make` to produce the final report in the project directory

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
      - Use the `Make Install` command in terminal to install project packages
      - Use the `Make` command to produce the final report from final repository
      - Use the `Make Clean` command to remove outputs and the final report
      - Use the `Make docker_report` command to produce the final report via docker hub
      
*The final html report may be rendered directly in the project repository or the final_report sub-folder.

## Docker Information

  - To build the image run: `docker build -t priya2edu/550final01 .`
  
  Docker Hub Image Link:
  https://hub.docker.com/repository/docker/priya2edu/550final01/general
  
**This report will likely build more appropriately on Mac/Linux-OS