CC       := gcc
CCFLAGS  := -g
GHC      := ghc
GHCFLAGS :=

export CCFLAGS:=$(CCFLAGS) -Wall -O3
export CC
LDFLAGS = -g

SRCDIR := src
OBJDIR := obj
OUTDIR := bin

DIRS := $(SRCDIR) $(OBJDIR) $(OUTDIR)

CSRC  := $(wildcard $(SRCDIR)/*.c)
COUT  := $(CSRC:$(SRCDIR)/%.c=$(OUTDIR)/%)
HSSRC := $(wildcard $(SRCDIR)/*.hs)
HSOUT := $(HSSRC:$(SRCDIR)/%.hs=$(OUTDIR)/%)
SHSRC := $(wildcard $(SRCDIR)/*.sh)
SHOUT := $(SHSRC:$(SRCDIR)/%.sh=$(OUTDIR)/%.sh)
OUT   := $(COUT) $(HSOUT) $(SHOUT)

.PHONY: build setup clean

build: | setup $(OUT)
	rm $(SRCDIR)/*.hi $(SRCDIR)/*.o || true

setup: $(DIRS)

$(DIRS):
	mkdir -p $@

clean:
	rm $(OBJDIR) $(OUTDIR) -rf

$(OUTDIR)/%: $(SRCDIR)/%.c
	$(CC) $(CCFLAGS) $< -o $@

$(OUTDIR)/%: $(SRCDIR)/%.hs
	$(GHC) $(GHCFLAGS) -o $@ $<

$(OUTDIR)/%.sh: $(SRCDIR)/%.sh
	cp $< $@
