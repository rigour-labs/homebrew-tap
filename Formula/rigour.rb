class Rigour < Formula
  desc "Rigour CLI quality gates for AI-generated code"
  homepage "https://github.com/rigour-labs/rigour"
  url "https://registry.npmjs.org/@rigour-labs/cli/-/cli-4.0.4.tgz"
  sha256 "048061984c779d873cc86a22d02ea6cdaf78de9394bf467a759ff127156b9efe"
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
