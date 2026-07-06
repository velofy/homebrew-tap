cask "pawse" do
  version "0.2.0"
  sha256 "96c817890b690a7d4c5e55955d0b36688321183faa3fcee069e96a479d98353c"

  url "https://github.com/anishfyi/pawse/releases/download/v#{version}/Pawse_#{version}_aarch64.dmg"
  name "Pawse"
  desc "Golden retriever that makes you take breaks"
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
