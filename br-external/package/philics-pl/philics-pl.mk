# philics-pl
PHILICS_PL_VERSION = 1.0
PHILICS_PL_SITE = $(BR2_EXTERNAL_QUT_PATH)/package/philics-pl/bitstreams
PHILICS_PL_SITE_METHOD = local
PHILICS_PL_INSTALL_IMAGES = YES
PHILICS_PL_INSTALL_TARGET = NO

ifeq ($(BR2_PACKAGE_PHILICS_PL_PACPWM),y)
	PHILICS_PL_BITSTREAM = pacpwm.bit
endif

ifeq ($(BR2_PACKAGE_PHILICS_PL_PHIL1PREGULAR),y)
	PHILICS_PL_BITSTREAM = phil-1p-regular.bit
endif

define PHILICS_PL_INSTALL_IMAGES_CMDS
    $(INSTALL) -D -m 0644 $(@D)/$(PHILICS_PL_BITSTREAM) $(BINARIES_DIR)/fpga.bit
endef

$(eval $(generic-package))