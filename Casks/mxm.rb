cask "mxm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.5.0"
  sha256 arm:   "75cf1266229acde10902c8766ddbaef0029f4385b80312daa9a82971b005ed9a",
         intel: "5a1657c63f9a78a8fe56b4c615917dfd17c154a344259d03de1712a49ded2346"

  url "https://github.com/p-chan/mxm/releases/download/v#{version}/mxm-#{arch}-apple-darwin.tar.xz"
  name "mxm"
  desc "CLI and daemon for configuring Logitech MX Master mice"
  homepage "https://github.com/p-chan/mxm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  binary "mxm-#{arch}-apple-darwin/mxm"
end
