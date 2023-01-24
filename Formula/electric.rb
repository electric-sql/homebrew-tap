class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://electric-sql.com"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0d0a4f6dd49bd822aed01c61b303d3d3598f6061a18fd1e86d6d21356846fc8a"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/electric-sql/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "6ff2714c70290a0dc00735ede885ecf3047020f96d139e64bc60f3a8ba8c026c"
    sha256 cellar: :any_skip_relocation, monterey:       "84edc04b7e3c7a3a3e6a4c4b25ccc8e766c484ed69edaa27828e99d291055c3b"
    sha256 cellar: :any_skip_relocation, big_sur:        "c38bfb06400be36901b7eef96921df010914f7c1df5c92dc333af2cf7934544c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "bd330ee3d01d13e5c331d0ba3d5c1eae26a92d3c3e8bf1690e1bec74ba455be3"
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
