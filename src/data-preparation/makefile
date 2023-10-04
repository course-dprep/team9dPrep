all: 0_installing_packages 1_data_download 2_data_cleaning 3_data_exploration 4_data_preparation clean-up

0_installing_packages:
    Rscript -e "source('src/data-preparation/0_installing_packages.R')"

1_data_download:
    Rscript -e "rmarkdown::render('src/data-preparation/1_data_download.Rmd')"

2_data_cleaning:
    Rscript -e "rmarkdown::render('src/data-preparation/2_data_cleaning.Rmd')"

3_data_exploration:
    Rscript -e "rmarkdown::render('src/data-preparation/3_data_exploration.Rmd')"

4_data_preparation:
    Rscript -e "rmarkdown::render('src/data-preparation/4_data_preparation.Rmd')"

clean-up:
    Rscript -e "source('src/data-preparation/clean-up.R')"
