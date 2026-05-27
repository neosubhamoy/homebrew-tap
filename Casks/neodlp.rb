cask "neodlp" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.5"
  sha256 arm:   "726e064fa1b19c5d3535135ff1d13a9de59532c00b6f13aa2a9bf4fa3d3b1846",
         intel: "88d6192d6a6865200750a8d55f12e4b24e308e029af71aa86e659e29ee2d0bb6"

  url "https://github.com/neosubhamoy/neodlp/releases/download/v#{version}/NeoDLP_#{version}_#{arch}.dmg",
      verified: "github.com/neosubhamoy/neodlp/"
  name "NeoDLP"
  desc "Modern video/audio downloader based on yt-dlp with browser integration"
  homepage "https://neodlp.neosubhamoy.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur
  depends_on formula: "aria2"

  app "NeoDLP.app"

  # Remove NeoDLP from macOS quarantine (bypass "damaged file" and "unvarified developer" warnings)
  postflight do
    system_command "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "/Applications/NeoDLP.app"]
  end

  zap trash: [
    "~/Library/Application Support/Chromium/NativeMessagingHosts/com.neosubhamoy.neodlp.json",
    "~/Library/Application Support/com.neosubhamoy.neodlp",
    "~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.neosubhamoy.neodlp.json",
    "~/Library/Application Support/Mozilla/NativeMessagingHosts/com.neosubhamoy.neodlp.json",
    "~/Library/LaunchAgents/com.neosubhamoy.neodlp.plist",
    "~/Library/Logs/com.neosubhamoy.neodlp",
    "~/yt-dlp-plugins/bgutil-ytdlp-pot-provider",
  ]
end
