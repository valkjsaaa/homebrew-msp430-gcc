class Msp430Support < Formula
  desc "Supporting Library for MSP430"
  homepage "http://www.ti.com/tool/MSP430-GCC-OPENSOURCE"
  url "http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/4_01_00_00/exports/msp430-gcc-support-files.zip"
  version "4.01.00.00"
  sha256 "86ccab9bce91fc7e9192f2ab96b3b94b70bb626ba88b8bdc945266ef44dbb4f8"

  def install
    cd "include"
    mkdir "#{prefix}/msp430-elf"
    mkdir "#{prefix}/msp430-elf/include"
    mkdir "#{prefix}/msp430-elf/lib"
    system "cp *.h #{prefix}/msp430-elf/include"
    system "cp *.ld #{prefix}/msp430-elf/lib"
  end

  test do
    system "cat", "#{prefix}/msp430-elf/include/msp430.h"
  end
end
