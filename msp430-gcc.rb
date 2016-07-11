class Msp430Gcc < Formula
  desc "GNU compiler collection for MSP430"
  homepage "https://gcc.gnu.org"
  url "https://ftpmirror.gnu.org/gcc/gcc-6.1.0/gcc-6.1.0.tar.bz2"
  mirror "https://ftp.gnu.org/gnu/gcc/gcc-6.1.0/gcc-6.1.0.tar.bz2"
  sha256 "09c4c85cabebb971b1de732a0219609f93fc0af5f86f6e437fd8d7f832f1a351"

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'
  depends_on 'msp430-binutils'

  def install
    mkdir 'build' do
      system "../configure", "--prefix=#{prefix}",
                             "--target=msp430-elf",
                             "--disable-werror",
                             "--disable-libssp",
                             "--disable-libmudflap",
                             "--disable-nls",
                             "--with-newlib",
                             "--with-as=#{Formula["msp430-binutils"].opt_prefix}/bin/msp430-elf-as",
                             "--with-ld=#{Formula["msp430-binutils"].opt_prefix}/bin/msp430-elf-ld",
                             "--without-headers",
                             "--enable-languages=c"
      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"
    end
  end

  test do
    system "#{bin}/msp430-gcc -v"
  end
end
