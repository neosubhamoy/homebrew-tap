cask "neodlp" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.3"
  sha256 arm:   "c0f1a7f5e876d929cef3b5f0063ba9d777fb33bb36fe719681baade6e0f6f225",
         intel: "ca4f270971f0150ae9256d10fd9a20057dafb53c5f8c44248ed38c13a909909f"

  url "https://github.com/neosubhamoy/neodlp/releases/download/v#{version}/NeoDLP_#{version}_#{arch}.dmg",
      verified: "github.com/neosubhamoy/neodlp/"
  name "NeoDLP"
  desc "Modern video/audio downloader based on yt-dlp with browser integration"
  homepage "https://neodlp.neosubhamoy.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"
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
