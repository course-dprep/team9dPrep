# Makefile in src/data-preparation
DPOUTPUT = ../../gen/data-preparation/output

all: $(DPOUTPUT)/0_installing_packages.R $(DPOUTPUT)/1_data_download.pdf $(DPOUTPUT)/2_data_cleaning.pdf $(DPOUTPUT)/3_data_exploration.pdf $(DPOUTPUT)/4_data_preparation.pdf $(DPOUTPUT)/clean-up.R

## Install packages
$(DPOUTPUT)/0_installing_packages.R: 0_installing_packages.R
	R --vanilla < $<

## Download data
$(DPOUTPUT)/1_data_download.pdf: 1_data_download.Rmd
	Rscript -e 'rmarkdown::render("$<")'

## Clean data
$(DPOUTPUT)/2_data_cleaning.pdf: 2_data_cleaning.Rmd
	Rscript -e 'rmarkdown::render("$<")'

## Explore data
$(DPOUTPUT)/3_data_exploration.pdf: 3_data_exploration.Rmd
	Rscript -e 'rmarkdown::render("$<")'

## Prepare data
$(DPOUTPUT)/4_data_preparation.pdf: 4_data_preparation.Rmd
	Rscript -e 'rmarkdown::render("$<")'

## Clean up
$(DPOUTPUT)/clean-up.R: clean-up.R
	R --vanilla < $<
