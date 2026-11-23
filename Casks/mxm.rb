cask "mxm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "85977ff602c6ec958d4a0e2e4b65aeea2ce8b03ffe91e7ef9aff6271d54fada5",
         intel: "6437c733ba888727527f9c5c51e4a0d4b6aebdedad39fcce7db3da31495ebe81"

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
