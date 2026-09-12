cask "deckwerk" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "fcfb683a5a796125a17079aeb1ba9eab270a4728ad0cc6dbe6476b3818bc52ab",
         intel: "53427d748c0ade499c311ce184613b92e688d62da08a1179ef27a7959ac859b9"

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
