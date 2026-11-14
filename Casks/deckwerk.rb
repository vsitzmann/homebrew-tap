cask "deckwerk" do
  arch arm: "arm64", intel: "x64"

  version "0.3.4"
  sha256 arm:   "0a4a990b1b88ecbb3af37616a38f1b86e025b9f051e6f29a1f2c1684e33a86f3",
         intel: "0c5608df6d299b4e231af7f0701ad57737905d57a0bca1fa89221aa649bb1816"

  url "https://github.com/vsitzmann/deckwerk/releases/download/v#{version}/deckwerk-#{version}-mac-#{arch}.dmg"
  name "DeckWerk"
  desc "Slide editor for video-heavy talks"
  homepage "https://deckwerk.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself (electron-updater, from the same GitHub release),
  # so "brew upgrade" leaves an installed copy alone rather than fighting it;
  # "brew upgrade --greedy" still upgrades it.
  auto_updates true
  depends_on :macos

  app "DeckWerk.app"

  zap trash: [
    "~/.deckwerk",
    "~/Library/Application Support/DeckWerk",
    "~/Library/Caches/org.deckwerk.DeckWerk",
    "~/Library/Preferences/org.deckwerk.DeckWerk.plist",
    "~/Library/Saved Application State/org.deckwerk.DeckWerk.savedState",
  ]
end
