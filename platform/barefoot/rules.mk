include $(PLATFORM_PATH)/platform-modules-arista.mk
include $(PLATFORM_PATH)/platform-modules-bfn.mk
include $(PLATFORM_PATH)/platform-modules-bfn-montara.mk
include $(PLATFORM_PATH)/platform-modules-wnc-osw1800.mk
include $(PLATFORM_PATH)/platform-modules-ingrasys.mk
include $(PLATFORM_PATH)/bfn-sai.mk
include $(PLATFORM_PATH)/docker-syncd-bfn.mk
include $(PLATFORM_PATH)/docker-syncd-bfn-rpc.mk
include $(PLATFORM_PATH)/docker-orchagent-bfn.mk
include $(PLATFORM_PATH)/one-aboot.mk
include $(PLATFORM_PATH)/one-image.mk
include $(PLATFORM_PATH)/libsaithrift-dev.mk
include $(PLATFORM_PATH)/docker-ptf-bfn.mk
include $(PLATFORM_PATH)/bfn-platform.mk
#include $(PLATFORM_PATH)/bfn-platform-wnc.mk
#include $(PLATFORM_PATH)/bfn-platform-ingrasys.mk
include $(PLATFORM_PATH)/bfn-modules.mk

SONIC_ALL += $(SONIC_ONE_IMAGE) $(SONIC_ONE_ABOOT) \
             $(DOCKER_FPM)

# Inject sai into sairedis
$(LIBSAIREDIS)_DEPENDS += $(BFN_SAI) $(WNC_OSW1800_PLATFORM) $(BFN_INGRASYS_PLATFORM) $(BFN_PLATFORM)  #$(LIBSAITHRIFT_DEV_BFN)

# Runtime dependency on sai is set only for syncd
$(SYNCD)_RDEPENDS += $(BFN_SAI) $(WNC_OSW1800_PLATFORM) $(BFN_INGRASYS_PLATFORM) $(BFN_PLATFORM)
