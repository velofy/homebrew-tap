cask "pawse" do
  version "0.2.5"
  sha256 "ea43e2cda18409d2309efb47fac64e829acc79ad171de502aae5aabcdca71d37"

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
