class Electric < Formula
  desc "CLI tool to interact with ElectricSQL cluster"
  homepage "https://brew.sh"
  url "https://github.com/electric-sql/cli/archive/refs/tags/v0.0.1-initial.tar.gz"
  version "0.0.1-initial-m1"
  sha256 "1a7f0013c5d5a7911df0ad8db2cec173570601761e74f3d72b9ad2b2cf2fd58f"
  license "Apache-2.0"

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
