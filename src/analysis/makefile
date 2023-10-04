# Makefile in src/analysis
ANALYSIS = ../../gen/analysis

all: $(ANALYSIS)/5_regression_model.pdf $(ANALYSIS)/6_shinyapp.R $(ANALYSIS)/clean-up.R

## Regression model
$(ANALYSIS)/5_regression_model.pdf: 5_regression_model.Rmd
	Rscript -e 'rmarkdown::render("$<")'

## Shiny App
$(ANALYSIS)/6_shinyapp.R: 6_shinyapp.R
	R --vanilla < $<

## Clean up
$(ANALYSIS)/clean-up.R: clean-up.R
	R --vanilla < $<
