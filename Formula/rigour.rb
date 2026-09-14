class Rigour < Formula
  desc "Rigour CLI quality gates for AI-generated code"
  homepage "https://github.com/rigour-labs/rigour"
  url "https://registry.npmjs.org/@rigour-labs/cli/-/cli-6.2.0.tgz"
  sha256 "d0e90dca6fd6201ce77db74e35e40bce29f2d64c1b762b4c49e261afdee1f446"
  license "MIT"

  depends_on "node"

  def install
    # Fresh publishes must install immediately in CI / same-day brew installs.
    # Homebrew/npm may otherwise enforce a min-release-age window (ETARGET).
    system "npm", "install", *std_npm_args(prefix: libexec), "--min-release-age=0"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/rigour", "--version"
  end
end
