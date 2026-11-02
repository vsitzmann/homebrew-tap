cask "deckwerk" do
  arch arm: "arm64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "6be1cc3e0b1d9ee5a04b9089c1879744eb636dec437cdbebdceba3be8921dfe0",
         intel: "c023f45cb43aeb575f575c233b553b10d2e03854204b27bae296ed41354dcacc"

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
