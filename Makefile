final_report/Edupuganti_550_final.html: Edupuganti_550_final.Rmd code/03_render_output.R output/scatterplot.rds output/table.rds
	Rscript code/03_render_output.R

# docker
docker_report:
	docker run --rm \
	-v $(PWD)/final_report:/home/rstudio/project/final_report \
	priya2edu/550final01

# creates output/scatterplot.rds
output/scatterplot.rds: code/02_scatterplot_output.R
	Rscript code/02_scatterplot_output.R

# creates output/table.rds
output/table.rds: code/01_table_output.R
	Rscript code/01_table_output.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f final_report/Edupuganti_550_final.html && rm -f Edupuganti_550_final.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
