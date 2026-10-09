cask "deckwerk" do
  arch arm: "arm64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "2054f13a0ed81f118de0766be452bd627651ed8d09081f44a04e5d56aab29f74",
         intel: "21e64087c24fe97828db5fedf34ac8aeb6fe66a98c33725e18ddc1efd6f3ece0"

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
