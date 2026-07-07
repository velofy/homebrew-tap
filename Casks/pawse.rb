cask "pawse" do
  version "0.2.3"
  sha256 "562953a2956a03e4988e59c9997e1d1b992a27b6907d3fb2b429d88ba2c4903d"

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
