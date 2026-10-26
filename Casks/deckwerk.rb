cask "deckwerk" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "60395e6f4c5532aec160feb58d7900b8bc5b6f7607ff93d2f95b05bccfc6a76b",
         intel: "66f823e7e4bc3c2160717f24c91ba1cd319f2a8193b7231b2270d1c03b84750d"

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
