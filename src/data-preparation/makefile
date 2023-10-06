DATA = ../../data/dataset1
DPINPUT = ../../gen/data-preparation/input
DPCURDIR := $(CURDIR)

.PHONY: install-packages clean-up

all: install-packages $(DATA)/milan_listings.csv $(DPINPUT)/clean_data.rds $(DPCURDIR)/3_data_exploration.pdf $(DPCURDIR)/4_data_preparation.pdf clean-up_dp

install-packages:
	Rscript 0_installing_packages.R

$(DATA)/milan_listings.csv: 1_data_download.Rmd
	Rscript -e 'rmarkdown::render("1_data_download.Rmd")'

$(DPINPUT)/clean_data.rds: 2_data_cleaning.Rmd
	Rscript -e 'rmarkdown::render("2_data_cleaning.Rmd")'

$(DPCURDIR)/3_data_exploration.pdf: 3_data_exploration.Rmd
	Rscript -e 'rmarkdown::render("3_data_exploration.Rmd")'

$(DPCURDIR)/4_data_preparation.pdf: 4_data_preparation.Rmd
	Rscript -e 'rmarkdown::render("4_data_preparation.Rmd")'

clean-up_dp:
	Rscript clean-up_dp.R