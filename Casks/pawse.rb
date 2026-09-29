cask "pawse" do
  version "0.2.6"
  sha256 "68fc4c2448956f0340a19eab209adc76122e269d4829aadfa71a41a18702cf56"

  url "https://github.com/velofy/pawse/releases/download/v#{version}/Pawse_#{version}_universal.dmg"
  name "Pawse"
  desc "Pomeranian that makes you take breaks"
  homepage "https://velofy.co/pawse/"

  depends_on :macos

  app "Pawse.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pawse.app"]
  end

  uninstall quit: "com.anishfyi.pawse"

  zap trash: [
    "~/Library/Application Support/com.anishfyi.pawse",
    "~/Library/Saved Application State/com.anishfyi.pawse.savedState",
  ]
end
