###################################

Assembler ?= clang
Compiler ?= clang -v
CompilerCpp ?= clang++ -v
Linker ?= orbis-ld -v
Archiver ?= orbis-ar
ObjectCopy ?= orbis-objcopy

###################################

MakePath := $(dir $(lastword $(MAKEFILE_LIST)))

SourcePath ?= source
IncludePath ?= -isysroot $(ORBISDEV) -I. -Iinclude
LibPath ?= -isysroot $(ORBISDEV) -L. -Llib
LibraryPath ?= $(LibPath)
BuildPath ?= build
OutPath ?= bin

###################################

# FIXME: Generate .... consolidate(TargetFile) -> ifdef ....

ifndef Target
ifdef target
Target := $(target)
endif
ifdef TARGET
Target := $(TARGET)
endif
endif

ifndef Debug
ifdef debug
Debug := $(debug)
endif
ifdef DEBUG
Debug := $(DEBUG)
endif
endif

ifdef Debug
Debug := -DDebug -g
endif

ifndef TargetFile
ifdef targetfile
TargetFile := $(targetfile)
endif
ifdef TARGETFILE
TargetFile := $(TARGETFILE)
endif
endif

ifndef Libraries
ifdef libraries
Libraries := $(libraries)
endif
ifdef LIBRARIES
Libraries := $(LIBRARIES)
endif
endif
Libraries ?=

ifndef Cf
ifdef cf
Cf := $(cf)
endif
ifdef CF
Cf := $(CF)
endif
endif
Cf ?=

ifndef Cppf
ifdef cppf
Cppf := $(cppf)
endif
ifdef CPPF
Cppf := $(CPPF)
endif
endif
Cppf ?=

ifndef Sf
ifdef sf
Sf := $(sf)
endif
ifdef SF
Sf := $(SF)
endif
endif
Sf ?=

ifndef Lf
ifdef lf
Lf := $(lf)
endif
ifdef LF
Lf := $(LF)
endif
endif
Lf ?=

###################################

AssemblerFlags = -m64
CompilerFlags = -std=c11 -O3 -Wall $(IncludePath) $(Debug)
CompilerFlagsCpp = -std=c++11 -O3 -Wall $(IncludePath) $(Debug)
LinkerFlags = $(LibraryPath) $(Debug)
ArchiverFlags = rcs

###################################

findwildcard_ = $(wildcard $1$2) $(strip $(foreach d,$(wildcard $1*),$(call findwildcard_,$d/,$2)))
findwildcard = $(call findwildcard_,$(strip $(1))/,$(strip $(2)))
dirp = @mkdir -p $(@D)
uniq = $(if $1,$(firstword $1) $(call uniq,$(filter-out $(firstword $1),$1)))

###################################

ifdef SourceFilesCForce
SourceFilesC := $(SourceFilesCForce)
else
SourceFilesC += $(call findwildcard, $(SourcePath), *.c)
endif
SourceFilesC := $(filter-out $(SourceFilterC),$(SourceFilesC))

ifdef SourceFilesCppForce
SourceFilesCpp := $(SourceFilesCppForce)
else
SourceFilesCpp += $(call findwildcard, $(SourcePath), *.cpp)
endif
SourceFilesCpp := $(filter-out $(SourceFilterCpp),$(SourceFilesCpp))

ifdef SourceFilesSForce
SourceFilesS := $(SourceFilesSForce)
else
SourceFilesS += $(call findwildcard, $(SourcePath), *.s)
endif
SourceFilesS := $(filter-out $(SourceFilterS),$(SourceFilesS))

ObjectFiles	+= \
	$(patsubst $(SourcePath)/%.cpp, $(BuildPath)/%.cpp.o, $(SourceFilesCpp)) \
	$(patsubst $(SourcePath)/%.c, $(BuildPath)/%.c.o, $(SourceFilesC)) \
	$(patsubst $(SourcePath)/%.s, $(BuildPath)/%.s.o, $(SourceFilesS))

TargetFile ?= $(basename $(notdir $(CURDIR)))
AllTarget ?= $(OutPath)/$(TargetFile)
CleanTarget ?= rm -fR $(BuildPath) $(OutPath)

###################################

assemble = $(Assembler) $(Sf) $(AssemblerFlags) -c -o $@ $<
compile = $(Compiler) $(Cf) $(CompilerFlags) -c -o $@ $< 
compileCpp = $(CompilerCpp) $(Cppf) $(CompilerFlagsCpp) -c -o $@ $<
link = $(Linker) $(Lf) $(CrtFile) $(call uniq,$? $(ObjectFiles)) $(LinkerFlags) $(Libraries) -o $@
archive = $(Archiver) $(ArchiverFlags) $@ $(call uniq,$? $(ObjectFiles))

###################################

.PHONY:: all clean foo
.DEFAULT_GOAL := all

###################################

include $(MakePath)/target/$(strip $(Target)).mk

###################################

$(BuildPath)/%.s.o: $(SourcePath)/%.s
	$(dirp)
	$(assemble)

$(BuildPath)/%.c.o: $(SourcePath)/%.c
	$(dirp)
	$(compile)

$(BuildPath)/%.cpp.o: $(SourcePath)/%.cpp
	$(dirp)
	$(compileCpp)

###################################

print-%  : ; @echo $* = $($*)
all::
clean::

###################################
