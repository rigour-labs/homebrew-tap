class Rigour < Formula
  desc "Rigour CLI quality gates for AI-generated code"
  homepage "https://github.com/rigour-labs/rigour"
  url "https://registry.npmjs.org/@rigour-labs/cli/-/cli-4.3.2.tgz"
  sha256 "fd92bf95ab493869841d32eabd8045bda9e6c96a7c391d5f7d29608e46441376"
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
