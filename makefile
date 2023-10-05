.PHONY: all data-preparation analysis

all: data-preparation analysis

data-preparation:
	@echo "Executing Makefile in data-preparation directory..."
	$(MAKE) -C /Users/emanuelefranceschini/Desktop/team-project-team_9_group_project/src/data-preparation
	@echo "Finished executing Makefile in data-preparation directory."

analysis:
	@echo "Executing Makefile in analysis directory..."
	$(MAKE) -C /Users/emanuelefranceschini/Desktop/team-project-team_9_group_project/src/analysis
	@echo "Finished executing Makefile in analysis directory."
