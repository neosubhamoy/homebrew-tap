cask "neodlp" do
    arch arm: "aarch64", intel: "x64"

    version "0.4.1"
    sha256 arm: "f3b10924b937d12886d3237ed22774277320361f7f72b05de3db944a8c4b4788",
           intel: "be5a1c9341ee3d8c3541a8a4d8daf9bd380c7ee090427db4c57d2de86e8b55e1"

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

    zap trash: [
        "~/Library/Application Support/com.neosubhamoy.neodlp",
        "~/Library/Application Support/Google/Chrome/NativeMessagingHosts/com.neosubhamoy.neodlp.json",
        "~/Library/Application Support/Chromium/NativeMessagingHosts/com.neosubhamoy.neodlp.json",
        "~/Library/Application Support/Mozilla/NativeMessagingHosts/com.neosubhamoy.neodlp.json",
        "~/Library/LaunchAgents/com.neosubhamoy.neodlp.plist",
        "~/Library/Logs/com.neosubhamoy.neodlp",
        "~/yt-dlp-plugins/bgutil-ytdlp-pot-provider"
    ]
end
