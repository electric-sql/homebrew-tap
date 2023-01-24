class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://electric-sql.com"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0d0a4f6dd49bd822aed01c61b303d3d3598f6061a18fd1e86d6d21356846fc8a"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/electric-sql/tap"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "278d403b663d40258d42af0d18aabe79f42a8ec9bb8fc1d3765b406ba7d74fda"
    sha256 cellar: :any_skip_relocation, monterey:       "88e7d0494208b0913c9f8d0a38963ab5e1a2852e3c7cca16959eb3d8bf792535"
    sha256 cellar: :any_skip_relocation, big_sur:        "0bd844e8addf23cac822f4b82c96e81610895247b2cec0a4c9b4059618675e13"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "2119c520da7eec8195e6b54c7e3bd8d76e03dddd17cee216d40df94588dbacc5"
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
