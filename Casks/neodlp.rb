cask "neodlp" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.2"
  sha256 arm:   "e8b5bab646f343412d337fc46f2fdd61fc6d1bd1c1b90e258ab95f0d64b5bb09",
         intel: "1f79943e89fbeaa70102469b40a81f5b560c69b7c699708ababb9d1bdbd8ad30"

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
