all: data-preparation analysis

data-preparation:
	make -C src/data-preparation

analysis:
	make -C src/analysis