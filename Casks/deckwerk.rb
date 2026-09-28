cask "deckwerk" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "f867360007b85cb85236e23c29c0f6303dc72e755922421b0240550597d54eba",
         intel: "ea43a8bea6b90210ba378185f76fecff70ba3d715b80b62042400425c3f60f4c"

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
