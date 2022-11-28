class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://electric-sql.com"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.0.2.tar.gz"
  version "0.0.2"
  sha256 "1a7f0013c5d5a7911df0ad8db2cec173570601761e74f3d72b9ad2b2cf2fd58f"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/electric-sql/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_monterey: "6c6d939eee9e678cf750781a74a2aeaf888d7da0651de831f8c9858aaf6dd3e5"
    sha256 cellar: :any_skip_relocation, monterey:       "e158e8aff413cf6fdcd830f70944a954088a01c15f87ddcc8da9e597a71eaf05"
    sha256 cellar: :any_skip_relocation, big_sur:        "7065fe47b9606aba5f83a49ab979ee7ac0e49d0ee9399dff71d4d49960713259"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "24f0be42fe62b081f64b6aad37f73c5bc0721244a48f9f450ac92b4061127019"
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
