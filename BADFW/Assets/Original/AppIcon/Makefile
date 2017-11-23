ASSETS_ROOT = ../../
SOURCE = icon.svg
-include $(ASSETS_ROOT)/common.mak
INSTALLDIR = $(ASSETS_ROOT)/Assets.xcassets/$(ASSET_NAME).appiconset/

$(INSTALLDIR)/Icon-60@2x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,120,$(SOURCE),$@)

$(INSTALLDIR)/Icon-60@3x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,180,$(SOURCE),$@)

$(INSTALLDIR)/Icon-76.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,76,$(SOURCE),$@)

$(INSTALLDIR)/Icon-76@2x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,152,$(SOURCE),$@)

$(INSTALLDIR)/Icon-83.5@2x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,167,$(SOURCE),$@)

$(INSTALLDIR)/Icon-Small-20.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,20,$(SOURCE),$@)

$(INSTALLDIR)/Icon-Small-20@2x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,40,$(SOURCE),$@)

$(INSTALLDIR)/Icon-Small-20@3x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,60,$(SOURCE),$@)

$(INSTALLDIR)/Icon-Small-40.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,40,$(SOURCE),$@)

$(INSTALLDIR)/Icon-Small-40@2x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,80,$(SOURCE),$@)

$(INSTALLDIR)/Icon-Small-40@3x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,120,$(SOURCE),$@)

$(INSTALLDIR)/Icon-Small.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,29,$(SOURCE),$@)

$(INSTALLDIR)/Icon-Small@2x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,58,$(SOURCE),$@)

$(INSTALLDIR)/Icon-Small@3x.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,87,$(SOURCE),$@)

$(INSTALLDIR)/Icon-AppStore.png: $(SOURCE)
	$(call IMAGEMAGICK_CONVERT,1024,$(SOURCE),$@)

all: $(INSTALLDIR)/Icon-60@2x.png $(INSTALLDIR)/Icon-60@3x.png $(INSTALLDIR)/Icon-76.png $(INSTALLDIR)/Icon-76@2x.png $(INSTALLDIR)/Icon-83.5@2x.png $(INSTALLDIR)/Icon-Small-20.png $(INSTALLDIR)/Icon-Small-20@2x.png $(INSTALLDIR)/Icon-Small-20@3x.png $(INSTALLDIR)/Icon-Small-40.png $(INSTALLDIR)/Icon-Small-40@2x.png $(INSTALLDIR)/Icon-Small-40@3x.png $(INSTALLDIR)/Icon-Small.png $(INSTALLDIR)/Icon-Small@2x.png $(INSTALLDIR)/Icon-Small@3x.png $(INSTALLDIR)/Icon-AppStore.png
