all: data-preparation analysis	open-zip compile-pdf run-pdf shinyapp

data-preparation:
	make -C src/data-preparation

analysis:data-preparation
	make -C src/analysis

open-zip:analysis
	make -C gen/paper/output

compile-pdf: open-zip
	make -C gen/paper/output

run-pdf: compile-pdf
	make -C gen/paper/output

shinyapp:run-pdf	
	make -C src/shinyapp
