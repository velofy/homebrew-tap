cask "pawse" do
  version "0.2.4"
  sha256 "e3298b5bde1066a134a385bb7a69b07703e2eb15019977de397a6453fbfe471d"

  url "https://github.com/anishfyi/pawse/releases/download/v#{version}/Pawse_#{version}_aarch64.dmg"
  name "Pawse"
  desc "Pomeranian that makes you take breaks"
  homepage "https://github.com/anishfyi/pawse"

  depends_on arch: :arm64
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
