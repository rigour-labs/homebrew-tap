class Rigour < Formula
  desc "Rigour CLI quality gates for AI-generated code"
  homepage "https://github.com/rigour-labs/rigour"
  url "https://registry.npmjs.org/@rigour-labs/cli/-/cli-6.5.1.tgz"
  sha256 "951ea40dc4f182ea9f1ebb16622d5157c76acffe1f0928534dd7d654fb5fcd05"
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
