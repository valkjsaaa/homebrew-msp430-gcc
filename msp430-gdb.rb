class Msp430Gdb < Formula
  desc "GNU debugger for MSP430"
  homepage "https://www.gnu.org/software/gdb/"
  url "https://ftpmirror.gnu.org/gdb/gdb-7.11.1.tar.xz"
  mirror "https://ftp.gnu.org/gnu/gdb/gdb-7.11.1.tar.xz"
  sha256 "e9216da4e3755e9f414c1aa0026b626251dfc57ffe572a266e98da4f6988fc70"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=msp430-elf",
                          "--program-prefix=msp430",
                          "--disable-nls",
                          "--disable-werror"
    system "make", "all"
    system "make", "install"
    # avoid conflict with binutil
    if Formula["msp430-binutils"].installed?
      rm_r share/"info"
      rm_r lib
    end
  end

  test do
    system "#{bin}/msp430-gdb -v"
  end
end
