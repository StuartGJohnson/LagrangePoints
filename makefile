# Directory variables
WRITEUP_DIR := writeup
WEBSITE_DIR := docs 
FIGURES_DIR := figures
VIDEO_DIR := videos

# Publish target: prepare website directory for GitHub Pages
# uncomment when needed
#publish: $(WEBSITE_DIR)/lagrange_points.pdf $(WEBSITE_DIR)/images $(WEBSITE_DIR)/videos
publish: $(WEBSITE_DIR)/lagrange_points.pdf

$(WEBSITE_DIR)/lagrange_points.pdf: $(WRITEUP_DIR)/lagrange_points.pdf
	mkdir -p $(WEBSITE_DIR)
	cp $< $@

$(WEBSITE_DIR)/images:
	mkdir -p $(WEBSITE_DIR)/images
	cp $(FIGURES_DIR)/*.png $(WEBSITE_DIR)/images/

$(WEBSITE_DIR)/videos:
	mkdir -p $(WEBSITE_DIR)/videos
	cp $(VIDEO_DIR)/*.mp4 $(WEBSITE_DIR)/videos/

