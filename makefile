# Define variables
R_SCRIPT := src/data-preparation/0_installing_packages.R
RMD_FILES := src/data-preparation/1_data_download.Rmd \
             src/data-preparation/2_data_cleaning.Rmd \
             src/data-preparation/3_data_exploration.Rmd \
             src/data-preparation/4_data_preparation.Rmd \
             src/analysis/5_regression_model.Rmd

R_FILES := src/analysis/6_shinyapp.R \
           src/analysis/7_clean-up.R

ZIP_FOLDER := gen/paper/output/final_paper
MAIN_TEX_FILE := $(ZIP_FOLDER)/main.tex
PDF_OUTPUT := $(ZIP_FOLDER)/main.pdf

# Define targets
all: install_packages data_analysis run_shinyapp clean_up assemble_pdf

# Target to install R packages
install_packages:
    Rscript $(R_SCRIPT)

# Rule to generate PDF from Rmd
%.pdf: %.Rmd
    Rscript -e "rmarkdown::render('$<', output_format = 'pdf_document')"

# Target for data analysis
data_analysis: $(RMD_FILES:.Rmd=.pdf)

# Target to run Shiny app
run_shinyapp: $(R_FILES)
    Rscript $<

# Target to clean up
clean_up: src/analysis/7_clean-up.R
    Rscript $<

# Target to assemble PDF from LaTeX files
assemble_pdf: $(PDF_OUTPUT)

# Rule to generate PDF from LaTeX files
$(PDF_OUTPUT): $(MAIN_TEX_FILE) $(ZIP_FOLDER)/LTJournalArticle.cls $(ZIP_FOLDER)/sample.bib $(ZIP_FOLDER)/Figures/*.png
    cd $(ZIP_FOLDER) && pdflatex main.tex && bibtex main && pdflatex main.tex && pdflatex main.tex

	
