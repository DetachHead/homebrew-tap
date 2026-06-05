cask "rebased" do
  os macos: "darwin", linux: "linux"

  on_macos do
    arch arm: "-aarch64", intel: ""
  end
  on_linux do
    arch arm: "-aarch64", intel: "-x86_64"
  end

  version "1.1.2"
  sha256 arm:          "853e8f22672e89616f81f624710a2aefbc505d6112b6f58e642fea44f4cabb10",
         intel:        "e0ec0b631ee44815dd2a99b8cf48dbf39c88754f384fc65522a8f5180eea0968",
         x86_64_linux: "7af5bedeb06ab5639f7a8fc3f06694b80ad1616b180e1c9ce8fe85110e3c8171",
         arm64_linux:  "65b0cacb0eb759a76743c55356bf6a8b307ea7d7dcc0cc8945baa5831014fc7e"

  url_base = on_system_conditional linux: "Rebased", macos: "rebased"
  url_end = on_system_conditional linux: ".AppImage", macos: ".dmg"

  url "https://github.com/DetachHead/rebased/releases/download/#{version}/#{url_base}#{arch}#{url_end}"
  name "Rebased"
  desc "Git client based on the IntelliJ platform"
  homepage "https://github.com/DetachHead/rebased"

  livecheck do
    url :url
    strategy :github_latest
  end

  on_macos do
    # depends_on :macos

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

  on_linux do
    app_image "Rebased#{arch}.AppImage", target: "Rebased.AppImage"
  end
end
