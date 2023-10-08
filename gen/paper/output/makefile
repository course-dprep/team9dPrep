.PHONY: all unzip-pdf generate-pdf

OUTPUT_DIR := $(CURDIR)
ZIP_FILE := final_paper.zip

all: unzip-pdf generate-pdf

unzip-pdf: $(ZIP_FILE)
	@echo "Opening ZIP file..."
	tar -xf $(ZIP_FILE) -C $(OUTPUT_DIR)
	@echo "ZIP file opened successfully."

generate-pdf: $(OUTPUT_DIR)/final_paper.tex
	@echo "Compiling LaTeX file to PDF..."
	cd $(OUTPUT_DIR) && pdflatex final_paper.tex
	@echo "PDF file compiled successfully."