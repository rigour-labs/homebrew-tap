class Rigour < Formula
  desc "Rigour CLI quality gates for AI-generated code"
  homepage "https://github.com/rigour-labs/rigour"
  url "https://registry.npmjs.org/@rigour-labs/cli/-/cli-6.7.10.tgz"
  sha256 "faf731d3bbf5225a19ca6acb81022178470b05cc1cb19619e7b15f57716196f8"
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
