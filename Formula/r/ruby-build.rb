class RubyBuild < Formula
  desc "Install various Ruby versions and implementations"
  homepage "https://github.com/rbenv/ruby-build"
  url "https://github.com/rbenv/ruby-build/archive/refs/tags/v20231225.tar.gz"
  sha256 "6e97008a983c24aa4e8674e68a5e41abaa6a111adc318f02e237d16cc68b498e"
  license "MIT"
  head "https://github.com/rbenv/ruby-build.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "eafad0e52ee58d118e7ec99a9a475ff250a0fbc6a4c083a79c217defd019e02a"
  end

  depends_on "autoconf"
  depends_on "libyaml"
  depends_on "pkg-config"
  depends_on "readline"
  on_macos do
    depends_on "openssl@3"
  end

  def install
    # these references are (as-of v20210420) only relevant on FreeBSD but they
    # prevent having identical bottles between platforms so let's fix that.
    inreplace "bin/ruby-build", "/usr/local", HOMEBREW_PREFIX

    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "2.0.0", shell_output("#{bin}/ruby-build --definitions")
  end
end
