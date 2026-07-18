cask "rebased" do
  version "1.1.8"

  on_macos do
    arch arm: "-aarch64", intel: ""

    sha256 arm:   "fd3bc8bd7f80be16294d424b25ca390ceb13960bba33422dfa8ac4632c3412c0",
           intel: "a5a9b6995d1659b1a8fbbf0bc03fb6c61a0be20e6c52816f9f208f63be7ff1f4"

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
