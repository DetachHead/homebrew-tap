cask "rebased" do
  version "1.0.12"

  on_macos do
    on_arm do
      sha256 "3ef9aace106128e78e94777c7fe64228cfa1df816e7cc15b8b1bc054b7df9e9c"

      url "https://github.com/DetachHead/rebased/releases/download/#{version}/rebased-aarch64.dmg"
    end
    on_intel do
      sha256 "93bc02e6c7ba06e907cfa540ed22d9eae0a7e3408810bf3bf07cd18a8bef6cdc"

      url "https://github.com/DetachHead/rebased/releases/download/#{version}/rebased.dmg"
    end

    app "Rebased.app"

    postflight do
      system_command "xattr",
                     args: ["-rd", "com.apple.quarantine", "#{appdir}/Rebased.app"]
    end
  end

  name "Rebased"
  desc "Git client based on the IntelliJ platform"
  homepage "https://github.com/DetachHead/rebased"

  livecheck do
    url :url
    strategy :github_latest
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
