cask "rebased" do
  version "1.1.7"

  on_macos do
    arch arm: "-aarch64", intel: ""

    sha256 arm:   "96ff88f715c1b9e99d69217d65e3de7852c39002bd1d072c35699c465677f84b",
           intel: "1d3a5a9f8aa731a906e6c750508db6cb90f5a10c240608fc15703a4bb51a63f8"

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
