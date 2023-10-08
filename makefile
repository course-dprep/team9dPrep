all: data-preparation analysis paper shinyapp

data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis

paper: analysis
	make -C gen/paper/output

shinyapp: paper	
	make -C src/shinyapp
