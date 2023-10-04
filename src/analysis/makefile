all: 5_regression_model 6_shinyapp clean-up

5_regression_model:
    Rscript -e "rmarkdown::render('src/analysis/5_regression_model.Rmd')"

6_shinyapp:
    Rscript -e "source('src/analysis/6_shinyapp.R')"

clean-up:
    Rscript -e "source('src/analysis/clean-up.R')"
