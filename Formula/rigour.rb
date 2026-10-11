class Rigour < Formula
  desc "Rigour CLI quality gates for AI-generated code"
  homepage "https://github.com/rigour-labs/rigour"
  url "https://registry.npmjs.org/@rigour-labs/cli/-/cli-7.0.1.tgz"
  sha256 "b8e7be879be8aa00b2b2949c875955df34799ea93850f16fb99df975eeffddbf"
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
