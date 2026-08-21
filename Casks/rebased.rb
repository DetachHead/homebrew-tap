cask "rebased" do
  version "1.1.14"

  on_macos do
    arch arm: "-aarch64", intel: ""

    sha256 arm:   "513fcbd58fe4bf3ad3c3a17b2a331482efe64a907b1ec3d44bc680b9d3ccaf58",
           intel: "375cb58e6c0bac87023537277cdf6c53cd7743b09846de21038e13a76b9d9fd4"

    url "https://github.com/DetachHead/rebased/releases/download/#{version}/rebased#{arch}.dmg"
  end

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
