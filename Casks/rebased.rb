cask "rebased" do
  arch arm: "-aarch64", intel: ""

  version "1.0.14"
  sha256 arm:   "1a164f6c11c84f0794d74daba5dfcff8a875284a0d6e99d6147e247e85739ffa",
         intel: "93c171762bdde51db7f83aacf82c9801a08911df5144e50bd7a9e8792defa93a"

  url "https://github.com/DetachHead/rebased/releases/download/#{version}/rebased#{arch}.dmg"
  name "Rebased"
  desc "Git client based on the IntelliJ platform"
  homepage "https://github.com/DetachHead/rebased"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Rebased.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Rebased.app"]
  end

  uninstall quit: "io.github.detachhead.rebased"

  zap trash: [
    "~/Library/Application Support/detachhead",
    "~/Library/Caches/detachhead",
    "~/Library/Logs/detachhead",
    "~/Library/Preferences/io.github.detachhead.rebased.plist",
    "~/Library/Saved Application State/io.github.detachhead.rebased.savedState",
  ]
end
