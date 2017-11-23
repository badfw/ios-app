define IMAGEMAGICK_CONVERT
       convert -colorspace RGB -density 400 -background none -resize $(1)x$(1) $(2) png32:$(3)
endef

.DEFAULT_GOAL=all

ASSET_NAME = $(shell basename $(shell pwd))
INSTALLDIR = $(ASSETS_ROOT)/Assets.xcassets/$(ASSET_NAME).imageset/
ASSET_1X = $(INSTALLDIR)/$(ASSET_NAME).png
ASSET_2X = $(INSTALLDIR)/$(ASSET_NAME)@2x.png
ASSET_3X = $(INSTALLDIR)/$(ASSET_NAME)@3x.png

BASE_SIZE ?= 32
SIZE_1X := $(BASE_SIZE)
SIZE_2X := $(shell echo ${BASE_SIZE}*2 | bc)
SIZE_3X := $(shell echo $(BASE_SIZE)*3 | bc)

# Debugging
print-% : ; @echo $* = $($*)
