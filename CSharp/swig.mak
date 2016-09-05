
!IF "$(SWIG_EXE)" == ""
SWIG_EXE=$(TOPDIR)\swigwin\swig.exe
!ENDIF

!IF "$(TOPDIR)" == ""
TOPDIR=..
!ENDIF

!IF "$(DLLIMPORT)" != ""
SWIG_DLLIMPORT= -dllimport $(DLLIMPORT)
!ENDIF

SWIG_DIR = $(TOPDIR)\SWIG
SWIG_SRC = $(SWIG_DIR)\quantlib.i
PRJ_DIR = $(TOPDIR)\CSharp
CPP_WRAPPER = $(PRJ_DIR)\cpp\quantlib_wrap.cpp
CS_DIR = $(PRJ_DIR)\csharp
NAMESPACE = QuantLib

MK_DEPS = $(SWIG_DIR)\*.i $(PRJ_DIR)\swig.mak

all: $(CPP_WRAPPER)

$(CPP_WRAPPER): $(MK_DEPS)
  @$(SWIG_EXE) -csharp -c++ -outdir $(CS_DIR) -namespace $(NAMESPACE) $(SWIG_DLLIMPORT) -o $@ $(SWIG_SRC)
