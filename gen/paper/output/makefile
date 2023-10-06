.PHONY: all unzip-pdf generate-pdf

OUTPUT_DIR := $(CURDIR)
ZIP_FILE := final_paper.zip

all: unzip-pdf generate-pdf

unzip-pdf: $(ZIP_FILE)
	@echo "Opening ZIP file..."
	unzip -o $(ZIP_FILE) -d $(OUTPUT_DIR)
	@echo "ZIP file opened successfully."

generate-pdf: $(OUTPUT_DIR)/main.tex
	@echo "Compiling LaTeX file to PDF..."
	cd $(OUTPUT_DIR) && pdflatex main.tex
	@echo "PDF file compiled successfully."
