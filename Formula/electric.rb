class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://brew.sh"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.0.1-initial.tar.gz"
  version "0.0.1-initial"
  sha256 "1a7f0013c5d5a7911df0ad8db2cec173570601761e74f3d72b9ad2b2cf2fd58f"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/electric-sql/tap"
    sha256                               monterey:     "95773c3b5e5e59d4285815c7e359dc1c67fbbb2a5716afd3752a0373a7296a29"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5d3031873b7f7e45eccb7ee8e23a80049d36175022cf05d057ea55de78ba18c9"
  end

  depends_on "elixir"
  depends_on "erlang"

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
