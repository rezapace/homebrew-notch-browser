cask "notch-browser" do
  version "0.7.1"
  sha256 "e3db216b265a67870b4a322711516d2763a4b3b9e02998a7c9719ea3802842f4"

  url "https://github.com/rezapace/notch-browser/releases/download/v#{version}/NotchBrowser.dmg"
  name "NotchBrowser"
  desc "Minimal browser that expands from the notch"
  homepage "https://github.com/rezapace/notch-browser"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "NotchBrowser.app"

  caveats <<~EOS
    NotchBrowser is ad-hoc signed and is not notarized by Apple.
    If macOS blocks opening, use System Settings > Privacy & Security > Open Anyway
    only if you trust this release.

    For the "Apple could not verify" warning and optional manual xattr steps, see:
      https://github.com/rezapace/notch-browser/blob/master/docs/homebrew.md#peringatan-gatekeeper
    Quarantine is not removed automatically.
  EOS
end
