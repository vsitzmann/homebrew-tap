cask "deckwerk" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "aedb48a3b545ec5ae66d760fc03cc4bb96d6d5f82a3aea66432a26c78c9e8c43",
         intel: "aa1a3d62b792e6b4c8328aa614223ed24ff63d886003c56d062ccb6347ed38f2"

  url "https://github.com/vsitzmann/deckwerk/releases/download/v#{version}/deckwerk-#{version}-mac-#{arch}.dmg",
      verified: "github.com/vsitzmann/deckwerk/"
  name "DeckWerk"
  desc "Slide editor for video-heavy talks"
  homepage "https://deckwerk.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "DeckWerk.app"

  zap trash: [
    "~/Library/Application Support/DeckWerk",
    "~/Library/Caches/org.deckwerk.DeckWerk",
    "~/Library/Preferences/org.deckwerk.DeckWerk.plist",
    "~/Library/Saved Application State/org.deckwerk.DeckWerk.savedState",
    "~/.deckwerk",
  ]
end
