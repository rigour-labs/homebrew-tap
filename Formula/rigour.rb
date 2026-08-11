class Rigour < Formula
  desc "Rigour CLI quality gates for AI-generated code"
  homepage "https://github.com/rigour-labs/rigour"
  url "https://registry.npmjs.org/@rigour-labs/cli/-/cli-5.5.4.tgz"
  sha256 "4264ae53cbf839e21a7c55aaffdc8eb0653933fbf07a8213ecba9408fd6237b1"
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
