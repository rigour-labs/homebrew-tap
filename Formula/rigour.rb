class Rigour < Formula
  desc "Rigour CLI quality gates for AI-generated code"
  homepage "https://github.com/rigour-labs/rigour"
  url "https://registry.npmjs.org/@rigour-labs/cli/-/cli-4.0.2.tgz"
  sha256 "9404b1202e2d77f9581e9080cb08ff2ce4bf4ae74a7ac6e702b3fa6478354ea8"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/rigour", "--version"
  end
end
