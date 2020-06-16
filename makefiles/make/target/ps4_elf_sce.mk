###################################
AssemblerFlags += -target x86_64-scei-ps4-elf -fPIE -dynamic
CompilerFlags = -cc1 -triple x86_64-scei-ps4-elf -munwind-tables -D__PS4__ -emit-obj $(IncludePath) $(Debug)
CompilerFlagsCpp = -cc1 -triple x86_64-scei-ps4-elf -munwind-tables -D__PS4__ -emit-obj $(IncludePath) $(Debug)
LinkerFlags += -Wl,--gc-sections -Wl,-z -Wl,max-page-size=0x4000 -Wl,--dynamic-linker="/libexec/ld-elf.so.1" -Wl,-pie -Wl,--eh-frame-hdr -L$(PS4SDK)/lib -target x86_64-scei-ps4-elf -T $(PS4SDK)/linker.x
CrtFile ?= $(ORBISDEV)/crt0.s  
#CrtFile ?= $(ORBISDEV)/crt0musl.s   $(ORBISDEV)/usr/lib/Scrt1.o $(ORBISDEV)/usr/lib/crti.o $(ORBISDEV)/usr/lib/crtn.o
###################################
###################################
#--gc-sections,
$(OutPath)/$(TargetFile):: $(ObjectFiles)
	$(dirp)
	$(link)

###################################

all:: $(AllTarget)
clean::
	$(CleanTarget)

