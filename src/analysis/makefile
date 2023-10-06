ANCURDIR := $(CURDIR)

.PHONY: clean-up_an

all: $(ANCURDIR)/5_regression_model.pdf clean-up_an

$(ANCURDIR)/5_regression_model.pdf: 5_regression_model.Rmd
	Rscript -e 'rmarkdown::render("5_regression_model.Rmd")'

clean-up_an:
	Rscript clean-up_an.R