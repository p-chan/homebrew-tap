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
