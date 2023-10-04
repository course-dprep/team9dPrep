# Makefile in the main directory

all: data-preparation analysis

data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis

