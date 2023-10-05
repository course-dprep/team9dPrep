
.PHONY: all 5_regression_model.Rmd 6_shinyapp.R clean-up.R

all: 5_regression_model.Rmd 6_shinyapp.R clean-up.R

5_regression_model.Rmd:
	@echo "Executing 5_regression_model.Rmd..."
	R -e "rmarkdown::render('src/analysis/5_regression_model.Rmd')"
	@echo "Finished executing 5_regression_model.Rmd."
6_shinyapp.R:
	@echo "Executing 6_shinyapp.R..."
	Rscript src/analysis/6_shinyapp.R
	@echo "Finished executing 6_shinyapp.R."
clean-up.R:
	@echo "Executing clean-up.R..."
	Rscript src/analysis/clean-up.R
	@echo "Finished executing clean-up.R."
