cask "mxm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.3"
  sha256 arm:   "ff716bbe5ff2b61826036311c56b92b60bb9e04a2067ec4e6af95f31b154b2ee",
         intel: "b119c1cb29eec09b39f0ff85dece91158e4c04b785a7b1a3d15b79dda3c41093"

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

  # Replace the daemon copy only for people who ran `mxm service install`.
  # `uninstall launchctl:` is left out on purpose: it also runs on upgrade,
  # and would remove the service that this update keeps.
  postflight_steps do
    run "mxm-{{arch}}-apple-darwin/mxm",
        base:           :staged_path,
        args:           ["service", "update"],
        print_stdout:   true,
        writable_paths: ["Library/Application Support/mxm"],
        writable_base:  :home
  end

  zap launchctl: "io.github.p-chan.mxm",
      trash:     [
        "~/Library/Application Support/mxm",
        "~/Library/LaunchAgents/io.github.p-chan.mxm.plist",
        "~/Library/Logs/mxm.log",
      ]
end
