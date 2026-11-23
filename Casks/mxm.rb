cask "mxm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "4b31fcee70623d3d2067fa70bb78eb34fb46578c53ae8817c720ca88ab16c4d2",
         intel: "75f8239c0c75e21d1ebd2e882bd93c341d2c87d1cd6ab19d4b540d5fd645cd9d"

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
