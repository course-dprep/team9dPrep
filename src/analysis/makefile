ANINPUT = ../../gen/analysis/input
ANCURDIR := $(CURDIR)

.PHONY: shinyapp clean-up_an

all: $(ANCURDIR)/5_regression_model.pdf shinyapp clean-up_an

$(ANCURDIR)/5_regression_model.pdf: 5_regression_model.Rmd
	Rscript -e 'rmarkdown::render("5_regression_model.Rmd")'

shinyapp:
	R --vanilla < 6_shinyapp.R

clean-up_an:
	Rscript clean-up_an.R