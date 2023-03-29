class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://electric-sql.com"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "849f66c3d4af9be9753f9b95cbd7dd27621417a115e2973b2aa131c4a5947478"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/electric-sql/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ffe82e62d097b1ebb4713293a49f0ed23ad0523df58db79e7076b6a3acb2e684"
    sha256 cellar: :any_skip_relocation, monterey:       "219159052f1fedf204ae06d1213f9c5713d185cc68f5205ca626a44852414cb3"
    sha256 cellar: :any_skip_relocation, big_sur:        "72200c5ba168b0f38c443a37c2214919f19be07396c4616b92f481960a26d8e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f138e419634cfbd1860a4b78f4a9a3206a4426a4e9b4fbb1bf1b10f5f87b8a5a"
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
