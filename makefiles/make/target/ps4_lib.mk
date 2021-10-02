###################################
IncludePath += -I$(ORBISDEV)/usr/include/orbis
AssemblerFlags += --target=x86_64-scei-ps4 -D_BSD_SOURCE
CompilerFlags += --target=x86_64-scei-ps4 -D__PS4__ -D_BSD_SOURCE
CompilerFlagsCpp += --target=x86_64-scei-ps4 -D__PS4__ -D_BSD_SOURCE
LinkerFlags += -Wl,--gc-sections,--gc-keep-exported -L$(PS4SDK)/lib
CrtFile ?= $(ORBISDEV)/crt0.o  
###################################
all:: $(AllTarget)
clean::
	$(CleanTarget)

