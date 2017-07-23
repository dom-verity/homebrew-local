######################################################################
# Name: 64tass.rb
# Description:
#   Homebrew formula to install the 64tass cross assembler.
#   This targets the 65xx series of microprocessors. It supports
#   6502, 65C02, R65C02, W65C02, 65CE02, 65816, DTV, 65EL02, 4510
#   and has a syntax close to that of the Omikron Turbo Assembler.
#
# Author: Dominic Verity
# Commenced: 23 July 2017
######################################################################

class Tass64 < Formula
  desc "Cross assembler targeting 65xx series processors with Omikron TASS syntax."
  homepage "http://singularcrew.hu/64tass/"

  stable do
    url "http://downloads.sourceforge.net/project/tass64/source/64tass-1.53.1515-src.zip"
    sha256 "f18e5d3f7f27231c1f8ce781eee8b585fe5aaec186eccdbdb820c1b8c323eb6c"

    # Patch Makefile to define _XOPEN_SOURCE in CFLAGS
    # to fix compilation on Darwin. 
    patch :p2, :DATA
  end

  head do
    url "svn://svn.code.sf.net/p/tass64/code/trunk"
  end
    
  def install
    # No configuration necessary
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/64tass -V"
  end
end

__END__
diff --git a/64tass-1.53.1515-src/Makefile b/64tass-1.53.1515-src.new/Makefile
index 809477a..7a47325 100644
--- a/64tass-1.53.1515-src/Makefile
+++ b/64tass-1.53.1515-src.new/Makefile
@@ -8,7 +8,7 @@ OBJ = 64tass.o opcodes.o str.o avl.o my_getopt.o eval.o error.o section.o \
 LDLIBS = -lm
 LANG = C
 REVISION := "1515?"
-CFLAGS = -O2 -DREVISION="\"$(REVISION)\""
+CFLAGS = -O2 -D_XOPEN_SOURCE=600 -DREVISION="\"$(REVISION)\""
 LDFLAGS =
 CFLAGS += $(LDFLAGS)
 TARGET = 64tass
@@ -16,7 +16,7 @@ RM = rm -f
 INSTALL = /usr/bin/install -c
 INSTALL_PROGRAM = $(INSTALL)
 INSTALL_DATA = $(INSTALL) -m 644
-prefix = /usr/local
+#prefix = /usr/local
 exec_prefix = $(prefix)
 bindir = $(exec_prefix)/bin
 datarootdir = $(prefix)/share
