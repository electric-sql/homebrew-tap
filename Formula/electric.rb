class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://electric-sql.com"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "d2d5780eccfceb09e14baa425a6c2d55ddf55b22aa2b03f324eb08496a3d28ba"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/electric-sql/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "0c3cd6f9c976981c9aefc7d94eb439f1ab5f6e6720c1c31f08ce19688acb7130"
    sha256 cellar: :any_skip_relocation, monterey:       "280db3791eaebba0fa1177b721b90ca56ee76d37f4cff973b5ef980a0822cff3"
    sha256 cellar: :any_skip_relocation, big_sur:        "12fcf7e3c5e251d619123d0fc8c20c14f3600a678eb8fa3cf769f6fcdc23827e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "0ff064652a9cde59393f1d0ad497a19fb6a4df89c2d7950e71bdccbe8a77824e"
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
