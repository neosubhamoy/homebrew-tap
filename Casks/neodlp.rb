cask "neodlp" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.4"
  sha256 arm:   "7ead23bd145fe4988d30d38faba0dcd165f9d233b0ce4d81b3c2ec040bb2caed",
         intel: "9ff7ca21be9dd16d2bae020510737e3510bd27e77f168a672e02af4e45100e06"

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
