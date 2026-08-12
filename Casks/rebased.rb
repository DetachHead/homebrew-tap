cask "rebased" do
  version "1.1.13"

  on_macos do
    arch arm: "-aarch64", intel: ""

    sha256 arm:   "788e7029e5a8b58cb419adcd24653bdffd72a126775c337929944a365ca150c5",
           intel: "97792938463b3270d2fecacd87280d37cfa97ce4e931aaf5fe74b9264f60afdf"

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
