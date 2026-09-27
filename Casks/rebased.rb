cask "rebased" do
  version "1.1.19"

  on_macos do
    arch arm: "-aarch64"

    sha256 arm:   "a125bbdf8c38f46a7f14e93be724844c8df359eb9c43dff53641b3e3201847b6",
           intel: "cfe6dab5d786f2728a8ffbf4aa9fc8f4b2f191eb8906f61f375d7b6bdd5a399c"

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
