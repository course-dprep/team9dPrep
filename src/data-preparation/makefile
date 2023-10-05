
.PHONY: all 0_installing_packages 1_data_download.Rmd 2_data_cleaning.Rmd 3_data_exploration.Rmd 4_data_preparation.Rmd clean-up.R

all: 0_installing_packages 1_data_download.Rmd 2_data_cleaning.Rmd 3_data_exploration.Rmd 4_data_preparation.Rmd clean-up.R

0_installing_packages:
	@echo "Executing 0_installing_packages.R..."
	Rscript /Users/emanuelefranceschini/Desktop/team-project-team_9_group_project/src/data-preparation/0_installing_packages.R
	@echo "Finished executing 0_installing_packages.R."

1_data_download.Rmd:
	@echo "Executing 1_data_download.Rmd..."
	R -e "rmarkdown::render('/Users/emanuelefranceschini/Desktop/team-project-team_9_group_project/src/data-preparation/1_data_download.Rmd')"
	@echo "Finished executing 1_data_download.Rmd."

2_data_cleaning.Rmd:
	@echo "Executing 2_data_cleaning.Rmd..."
	R -e "rmarkdown::render('/Users/emanuelefranceschini/Desktop/team-project-team_9_group_project/src/data-preparation/2_data_cleaning.Rmd')"
	@echo "Finished executing 2_data_cleaning.Rmd."
3_data_exploration.Rmd:
	@echo "Executing 3_data_exploration.Rmd..."
	R -e "rmarkdown::render('/Users/emanuelefranceschini/Desktop/team-project-team_9_group_project/src/data-preparation/3_data_exploration.Rmd')"
	@echo "Finished executing 3_data_exploration.Rmd."
4_data_preparation.Rmd:
	@echo "Executing 4_data_preparation.Rmd..."
	R -e "rmarkdown::render('/Users/emanuelefranceschini/Desktop/team-project-team_9_group_project/src/data-preparation/4_data_preparation.Rmd')"
	@echo "Finished executing 4_data_preparation.Rmd."
clean-up.R:
	@echo "Executing clean-up.R..."
	Rscript /Users/emanuelefranceschini/Desktop/team-project-team_9_group_project/src/data-preparation/clean-up.R
	@echo "Finished executing clean-up.R."
