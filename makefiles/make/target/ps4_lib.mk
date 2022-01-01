###################################
IncludePath += -I$(ORBISDEV)/usr/include/orbis
PlatformFlags += --target=x86_64-scei-ps4 -D__PS4__ -D__ORBIS__
AssemblerFlags += --target=x86_64-scei-ps4
CompilerFlags += $(PlatformFlags)
CompilerFlagsCpp += $(PlatformFlags)
#LinkerFlags += -Wl,--gc-sections,--gc-keep-exported -L$(ORBISDEV)/usr/lib
#CrtFile ?= $(ORBISDEV)/usr/lib/crt0.o  
###################################
all:: $(AllTarget)
clean::
	$(CleanTarget)

