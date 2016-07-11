class Msp430Binutils < Formula
  desc "FSF Binutils for native development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "https://ftpmirror.gnu.org/binutils/binutils-2.26.1.tar.gz"
  mirror "https://ftp.gnu.org/gnu/binutils/binutils-2.26.1.tar.gz"
  sha256 "dd9c3e37c266e4fefba68e444e2a00538b3c902dd31bf4912d90dca6d830a2a1"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=msp430",
                          "--disable-werror",
                          "--disable-nls"
    system "make"
    system "make", "install"
    # avoid conflict with gdb
    if Formula["msp430-gdb"].installed?
      rm_r share/"info"
      rm_r lib
    end
  end

  test do
    system "#{bin}/msp430-objdump -i"
  end
end
