cask "rebased" do
  version "1.1.3"

  on_macos do
    arch arm: "-aarch64", intel: ""

    sha256 arm:   "58b14892b8d4af4d787336735ac62acf6a76dce535bfb14b3c36bd3bfe8ec96b",
           intel: "8e5d8da51b41c39e7c82220e29ce983fbd3b69578e6b51dcbff18e648e66afb5"

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
