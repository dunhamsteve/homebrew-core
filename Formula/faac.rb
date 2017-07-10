class Faac < Formula
  desc "ISO AAC audio encoder"
  homepage "http://www.audiocoding.com/faac.html"
  url "https://downloads.sourceforge.net/project/faac/faac-src/faac-1.29/faac-1.29.tar.gz"
  sha256 "8cc7b03ceb2722223a6457e95d4c994731d80214a03ba33d1af76ba53f4b3197"

  bottle do
    cellar :any
    rebuild 1
    sha256 "1537586f1bb69e142a32886ba9ac6e8e244dc297d8be441573e46eacd57e7075" => :sierra
    sha256 "4607ea16f33aec6dabefe6ace66c41cb7ee487b03fff8c7b2d050cbc6340422f" => :el_capitan
    sha256 "c3fad36cecb8f5d4fc17ad5912d90ee9dffafeb2c5c60b21d27d9ea8bfeb351d" => :yosemite
    sha256 "1b97bdfb9334decc5d51c9d57788fa23ccf77c56d74a53fcfe6f21a4495ba463" => :mavericks
    sha256 "e2cf2e63defd76653bc96443956f28bb9e0388a76cda5d0c8c463528d68a191a" => :mountain_lion
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "./bootstrap"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"faac", test_fixtures("test.mp3"), "-P", "-o", "test.m4a"
    assert File.exist?("test.m4a")
  end
end
