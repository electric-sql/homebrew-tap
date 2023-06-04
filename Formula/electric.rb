class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://electric-sql.com"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "4e72998289789e1aac3c1c5a932b9e8d863a346f4d991a796d084376369516c7"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/electric-sql/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "0f3f95441c40c0a0066dc59859958f93da9ea2c09e769b7c962e83384e7d0685"
    sha256 cellar: :any_skip_relocation, monterey:       "7b2f7078f5ac21d6ab248fbcb78f0ee495e2a880c7191b318d5f3c35dc60bba8"
    sha256 cellar: :any_skip_relocation, big_sur:        "bf2c8d7649719ff2a6bdb9c49e4d0e068a193d89322cbbcdc99336c36d934d7a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "dbd69194ef585d2d99f9a64de26a580b84af9583a81512bffacbfe13b0c6ede8"
  end

  depends_on "elixir" => :build
  depends_on "erlang" => :build

  def install
    system "mix", "local.hex", "--force"
    system "mix", "local.rebar", "--force"
    system "./release.sh"

    bin.install "_build/prod/rel/bakeware/electric"
  end

  test do
    system "true"
  end
end
