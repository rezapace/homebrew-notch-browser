# Homebrew Tap — NotchBrowser

Tap untuk [NotchBrowser](https://github.com/rezapace/notch-browser), browser native macOS yang mengembang dari notch.

**Apple Silicon (arm64), macOS 13+.** Aplikasi GUI dipasang sebagai **Cask** dari DMG release, bukan dikompilasi oleh Homebrew.

## Install

```sh
brew install --cask rezapace/notch-browser/notch-browser
```

Atau tambahkan tap dahulu:

```sh
brew tap rezapace/notch-browser
brew install --cask rezapace/notch-browser/notch-browser
```

Pada Homebrew 6+, untuk memakai nama pendek, percayai cask ini saja:

```sh
brew trust --cask rezapace/notch-browser/notch-browser
brew install --cask notch-browser
```

Homebrew lama belum memiliki `brew trust`; perintah fully qualified direkomendasikan untuk semua versi.

## Update / uninstall

Keluar dari aplikasi dengan **⌘Q** sebelum update.

```sh
brew update
brew upgrade --cask rezapace/notch-browser/notch-browser

brew uninstall --cask rezapace/notch-browser/notch-browser
```

Tidak ada hook penghapus cookie/cache/profil. Jika app dari instalasi manual sudah ada, keluar dan pindahkan app bundle lama terlebih dahulu; jangan menghapus data browser.

## Keamanan

Cask memverifikasi SHA-256 dan memakai URL versi tetap. Tidak ada hook otomatis untuk menghapus quarantine atau bypass Gatekeeper. Aplikasi masih **ad-hoc signed, belum notarized**. Jika macOS memblokir pembukaan, gunakan **System Settings → Privacy & Security → Open Anyway** hanya jika Anda mempercayai sumbernya.

Ini tap proyek sendiri, bukan cask resmi `Homebrew/homebrew-cask`. Notice/lisensi aplikasi tetap mengikuti [repository aplikasi](https://github.com/rezapace/notch-browser/blob/master/licenses/THIRD_PARTY_NOTICES.md).

## Peringatan Gatekeeper

Jika setelah instalasi muncul:

> Apple could not verify “NotchBrowser.app” is free of malware that may harm your Mac or compromise your privacy.

Utamakan **System Settings → Privacy & Security → Open Anyway**. Alternatif Terminal, **hanya jika mempercayai sumber release**:

```sh
xattr -dr com.apple.quarantine /Applications/NotchBrowser.app
open /Applications/NotchBrowser.app
```

Opsi lebih luas `xattr -cr /Applications/NotchBrowser.app` juga menghapus quarantine, tetapi menghapus **semua extended attributes** dalam app bundle. Pilih opsi terbatas di atas bila cukup; tidak perlu menjalankan keduanya.

Ini melewati pemeriksaan Gatekeeper berbasis quarantine untuk app tersebut, bukan pemindaian malware atau notarization. Homebrew **tidak menjalankannya otomatis**. Sesuaikan path untuk `--appdir` lain. Update app dapat mengembalikan quarantine. [Panduan lengkap](https://github.com/rezapace/notch-browser/blob/master/docs/homebrew.md#peringatan-gatekeeper).

## Pemeliharaan

`Casks/notch-browser.rb` dihasilkan oleh `scripts/homebrew.sh` di repository aplikasi, dari DMG final yang checksum/signature/versi/arsitekturnya sudah diverifikasi. Publish DMG dan `SHA256SUMS` sebelum memperbarui tap. Jangan menimpa asset pada versi lama setelah checksum dipakai cask.

Validasi cask setelah memperbarui tap:

```sh
brew trust --cask rezapace/notch-browser/notch-browser
brew style rezapace/notch-browser/notch-browser
brew audit --cask --online rezapace/notch-browser/notch-browser
```

Audit signing dapat melaporkan build ad-hoc yang belum notarized; jangan mengakali Gatekeeper untuk membuat audit tersebut lolos. Uji instalasi dengan `--appdir` sementara agar tidak menimpa app pengguna.

Panduan lengkap: [Homebrew dan alur release](https://github.com/rezapace/notch-browser/blob/master/docs/homebrew.md).
