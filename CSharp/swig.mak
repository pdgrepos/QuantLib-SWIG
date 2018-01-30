
!IF "$(TOPDIR)" == ""
TOPDIR=..
!ENDIF

!IF "$(SWIG_EXE)" == ""
SWIG_EXE=$(TOPDIR)\swigwin\swig.exe
!ENDIF

!IF "$(DLLIMPORT)" != ""
SWIG_DLLIMPORT= -dllimport $(DLLIMPORT)
!ENDIF

SWIG_DIR = $(TOPDIR)\SWIG
SWIG_SRC = $(SWIG_DIR)\quantlib.i
PRJ_DIR = $(TOPDIR)\CSharp
CPP_WRAPPER = $(PRJ_DIR)\cpp\quantlib_wrap.cpp
CS_DIR = $(PRJ_DIR)\csharp\generated
NAMESPACE = QuantLib

DONE = $(CS_DIR)\.done

MK_DEPS = $(SWIG_DIR)\*.i $(PRJ_DIR)\swig.mak

all: $(DONE)

$(DONE): $(MK_DEPS)
  @if not exist $(CS_DIR) mkdir $(CS_DIR)
  @del /s /q $(CS_DIR) > NUL
  @echo Generating swig files...
  @$(SWIG_EXE) -csharp -c++ -outdir $(CS_DIR) -namespace $(NAMESPACE) $(SWIG_DLLIMPORT) -o $(CPP_WRAPPER) $(SWIG_SRC)
  @echo: > $@
