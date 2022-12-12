class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://electric-sql.com"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "2b25290fcf645ea7d003077e2a2f19f2667dfe4240bd7ca45150d2c4f9870d9a"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/electric-sql/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "9134590eacaee30140e8d10db1fa8b978592dfc25561e8e35623ec8a0b6d63ab"
    sha256 cellar: :any_skip_relocation, monterey:       "6937317ea6339644e28e0afd763d89b2bbc0f09eb4788d0ea5216415d478c2c8"
    sha256 cellar: :any_skip_relocation, big_sur:        "ead0c32cb7b89799c042e758de710e2315b5b17fd88d0876158ba8203eba6575"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f6444942cf6eca4e72ffb5bcea898a872827f5eecf6922b4dc600d3cffad49d0"
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
