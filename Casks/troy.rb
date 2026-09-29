cask "troy" do
  version "0.1.5"

  on_arm do
    sha256 "3904cc44554e4e5103cecc5d02f6a72fe01d528ebfb4d537bbea249198c73a1f"

    url "https://github.com/velofy/troy/releases/download/v#{version}/Troy-mac-arm64.dmg",
        verified: "github.com/velofy/troy/"
  end
  on_intel do
    sha256 "d290878d3881c7420dabaf2cab752e6eae2a0657555c1e0b216033fb518ba812"

    url "https://github.com/velofy/troy/releases/download/v#{version}/Troy-mac-x64.dmg",
        verified: "github.com/velofy/troy/"
  end

  name "Troy"
  desc "Browser an agent can actually read and drive"
  homepage "https://velofy.co/troy/"

  depends_on macos: :monterey

  app "Troy.app"

  # Troy is ad-hoc signed but not notarised, so Gatekeeper would otherwise
  # refuse the first launch and send people looking for the Control-click
  # trick. Installing through this tap is already an explicit act of trust in
  # the source, so the quarantine flag is cleared here instead.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Troy.app"]
  end

  uninstall quit: "com.anishfyi.troy"

  zap trash: [
    "~/Library/Application Support/Troy",
    "~/Library/Caches/com.anishfyi.troy",
    "~/Library/Preferences/com.anishfyi.troy.plist",
    "~/Library/Saved Application State/com.anishfyi.troy.savedState",
  ]
end
