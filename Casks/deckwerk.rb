cask "deckwerk" do
  arch arm: "arm64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "08d38590ebe4f853c576de37e024c1be3c28291cc25ba66db050a84990f51e19",
         intel: "5a6651545a7228f889e830494582e9dad5df5aee0d8090fa7429f29f006e322a"

  url "https://github.com/vsitzmann/deckwerk/releases/download/v#{version}/deckwerk-#{version}-mac-#{arch}.dmg",
      verified: "github.com/vsitzmann/deckwerk/"
  name "DeckWerk"
  desc "Slide editor for video-heavy talks"
  homepage "https://deckwerk.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself (electron-updater, from the same GitHub release),
  # so "brew upgrade" leaves an installed copy alone rather than fighting it;
  # "brew upgrade --greedy" still upgrades it.
  auto_updates true

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
