cask "rebased" do
  version "1.1.17"

  on_macos do
    arch arm: "-aarch64"

    sha256 arm:   "982173398894d7aabb292f6d66fb9257395996af0496e4d233fc7ad0d5abc087",
           intel: "3eade510382ce27baf8863d67927eb6b8bb502911f1de3f924a1f4628ab575c4"

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
