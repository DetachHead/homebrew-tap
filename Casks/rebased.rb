cask "rebased" do
  version "1.1.4"

  on_macos do
    arch arm: "-aarch64", intel: ""

    sha256 arm:   "3803da85a9302926f8c09d644e2bfc7799f4fe39a2dfba8c613aa51c9eebf7dd",
           intel: "f9d0d5b04902f561691fbf2dd1c84b31b6e9c6bbff5fd44d07714067834bc649"

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
