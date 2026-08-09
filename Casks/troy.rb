cask "troy" do
  version "0.1.4"

  on_arm do
    sha256 "0699f2d199beca90988c6adcb2fe8f61b695ffb62802a5900d410a3aabdbafaa"
    url "https://github.com/anishfyi/troy/releases/download/v#{version}/Troy-mac-arm64.dmg",
        verified: "github.com/anishfyi/troy/"
  end

  on_intel do
    sha256 "30bf18e3248374c25d22f24209cb0409cccd49670a4e276370df619212cab29a"
    url "https://github.com/anishfyi/troy/releases/download/v#{version}/Troy-mac-x64.dmg",
        verified: "github.com/anishfyi/troy/"
  end

  name "Troy"
  desc "Browser an agent can actually read and drive"
  homepage "https://anishfyi.com/troy"

  depends_on macos: :big_sur

  app "Troy.app"

  # Troy is ad-hoc signed but not notarised, so Gatekeeper would otherwise
  # refuse the first launch and send people looking for the Control-click
  # trick. Installing through this tap is already an explicit act of trust in
  # the source, so the quarantine flag is cleared here instead.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Troy.app"],
                   sudo: false
  end

  uninstall quit: "com.anishfyi.troy"

  zap trash: [
    "~/Library/Application Support/Troy",
    "~/Library/Preferences/com.anishfyi.troy.plist",
    "~/Library/Saved Application State/com.anishfyi.troy.savedState",
    "~/Library/Caches/com.anishfyi.troy",
  ]
end
