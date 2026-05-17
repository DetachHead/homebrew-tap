cask "rebased" do
  version "1.0.15"

  on_macos do
    arch arm: "-aarch64", intel: ""

    sha256 arm:   "4fd09fd80c518249ce40eea90f22d41fc468a95f79b09083d0a5a315ef29e957",
           intel: "d19ffc6e371f0a400ac1cddea9c4e4787a666ee131f70bc6c202cd3ed3a9c2ef"

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
