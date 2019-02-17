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
    url "https://sourceforge.net/projects/tass64/files/source/64tass-1.54.1864-src.zip"
    sha256 "3704049838815c29de5cf4ec6fcd1fb5c08942646705b61c0b89e73ef218d0b6"
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
