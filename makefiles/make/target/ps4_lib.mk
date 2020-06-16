###################################
IncludePath += -I$(ORBISDEV)/usr/include/orbis
AssemblerFlags += -target x86_64-scei-ps4 -D_BSD_SOURCE
CompilerFlags += -ffreestanding -fno-builtin -fno-stack-protector -target x86_64-scei-ps4 -D__PS4__ -D_BSD_SOURCE -fPIC
CompilerFlagsCpp += -ffreestanding -fno-builtin -fno-stack-protector -target x86_64-scei-ps4 -D__PS4__ -D_BSD_SOURCE -fPIC
LinkerFlags += -Wl,--gc-sections,--gc-keep-exported -L$(PS4SDK)/lib
CrtFile ?= $(PS4SDK)/crt0musl.s  
###################################
all:: $(AllTarget)
clean::
	$(CleanTarget)

