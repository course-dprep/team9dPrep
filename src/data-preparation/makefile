DPCURDIR := $(CURDIR)

.PHONY: install-packages clean-up

all: install-packages $(DPCURDIR)/1_data_download.pdf $(DPCURDIR)/2_data_cleaning.pdf $(DPCURDIR)/3_data_exploration.pdf $(DPCURDIR)/4_data_preparation.pdf clean-up_dp

install-packages:
	Rscript 0_installing_packages.R

$(DPCURDIR)/1_data_download.pdf: 1_data_download.Rmd
	Rscript -e 'rmarkdown::render("1_data_download.Rmd")'

$(DPCURDIR)/2_data_cleaning.pdf: 2_data_cleaning.Rmd
	Rscript -e 'rmarkdown::render("2_data_cleaning.Rmd")'

$(DPCURDIR)/3_data_exploration.pdf: 3_data_exploration.Rmd
	Rscript -e 'rmarkdown::render("3_data_exploration.Rmd")'

$(DPCURDIR)/4_data_preparation.pdf: 4_data_preparation.Rmd
	Rscript -e 'rmarkdown::render("4_data_preparation.Rmd")'

clean-up_dp:
	Rscript clean-up_dp.R