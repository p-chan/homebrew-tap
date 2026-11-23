cask "mxm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.2"
  sha256 arm:   "801c73e6aa37d17347720dd08121d352713b5975f4f2b1c322ffeb3eb45284fb",
         intel: "ff939d7d1a3028e59c013ed983a4045ff0705023b5c84f66bd1504b4429d2973"

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
