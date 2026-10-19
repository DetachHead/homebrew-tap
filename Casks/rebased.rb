cask "rebased" do
  version "1.1.22"

  on_macos do
    arch arm: "-aarch64"

    sha256 arm:   "6cbcb2109ea9d5db09b07d4cafea536e361e8fdc73d9b7b4fb25bd461a5d5f16",
           intel: "9f28d63e59809d28dbc2b31df60dd630a9a5f258170e92e6c939cb47f523e1c4"

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

  postflight_steps do
    run "xattr",
        args: ["-rd", "com.apple.quarantine", "{{appdir}}/Rebased.app"]
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
