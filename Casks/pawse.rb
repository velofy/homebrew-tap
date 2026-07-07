cask "pawse" do
  version "0.2.4"
  sha256 "4a8b50fe3efaea89d60a84976c7f766b66f1af43bdb57321eacc364d175794e4"

  url "https://github.com/anishfyi/pawse/releases/download/v#{version}/Pawse_#{version}_universal.dmg"
  name "Pawse"
  desc "Pomeranian that makes you take breaks"
  homepage "https://github.com/anishfyi/pawse"

  depends_on macos: :catalina

  app "Pawse.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pawse.app"],
                   sudo: false
  end

  uninstall quit: "com.anishfyi.pawse"

  zap trash: [
    "~/Library/Application Support/com.anishfyi.pawse",
    "~/Library/Saved Application State/com.anishfyi.pawse.savedState",
  ]
end
