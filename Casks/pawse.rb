cask "pawse" do
  version "0.2.2"
  sha256 "d1041e9b52c2cf2c6babc30e3aae547d784b741086dc69cc19e2e94421f34c9b"

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
