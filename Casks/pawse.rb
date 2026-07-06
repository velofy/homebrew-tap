cask "pawse" do
  version "0.2.1"
  sha256 "7dd31319597f2312a4526321ab65f7c4487d9b3bd4bacb1c2fe53ce82fc0acb7"

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
