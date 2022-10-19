class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://electric-sql.com"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.0.1-initial.tar.gz"
  version "0.0.1-initial-m1"
  sha256 "1a7f0013c5d5a7911df0ad8db2cec173570601761e74f3d72b9ad2b2cf2fd58f"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/electric-sql/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "9a60d53578f595a41887ccfea7b17d0d4e705561c829b5b1cae5a3b31c202897"
    sha256 cellar: :any_skip_relocation, monterey:       "2db50b26d7fd1e44e402681fc0829701ed1523892f10aa54bebba13b08c5424a"
    sha256 cellar: :any_skip_relocation, big_sur:        "9d7c58b742bc64f98948fe557be9f9c92b9c9042bb5ddea22cb367ce3554acee"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e74a8dc52ae428dfceec5e27606d2a49f2a7a82e7aca0f778e583155f673f71a"
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
