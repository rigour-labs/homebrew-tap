class Rigour < Formula
  desc "Rigour CLI quality gates for AI-generated code"
  homepage "https://github.com/rigour-labs/rigour"
  url "https://registry.npmjs.org/@rigour-labs/cli/-/cli-5.2.2.tgz"
  sha256 "8a099bff7e54d6b825f08504c0e90c0bbf4357807c475054f8a81a698237375a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/rigour", "--version"
  end
end
