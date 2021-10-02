###################################
AssemblerFlags += --target=x86_64-scei-ps4 -fPIE -dynamic
CompilerFlags = --target=x86_64-scei-ps4 -D__PS4__ $(IncludePath) $(Debug)
CompilerFlagsCpp = --target=x86_64-scei-ps4 -D__PS4__ $(IncludePath) $(Debug)
LinkerFlags += -Wl,--gc-sections -Wl,-z -Wl,max-page-size=0x4000 -Wl,--dynamic-linker="/libexec/ld-elf.so.1" -Wl,-pie -Wl,--eh-frame-hdr -L$(ORBISDEV)/usr/lib -target x86_64-scei-ps4-elf -T $(ORBISDEV)/linker.x
CrtFile ?= $(ORBISDEV)/crt0.o
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

