# anishfyi/homebrew-tap

Homebrew tap for my apps.

## Pawse

The golden retriever that makes you take breaks. [Source](https://github.com/anishfyi/pawse) · [Site](https://anishfyi.github.io/pawse/).

```sh
brew tap anishfyi/tap
brew install --cask pawse
```

If Homebrew asks you to trust the tap first (a security gate for third-party taps):

```sh
brew trust anishfyi/tap
brew install --cask pawse
```

Apple Silicon only for now (the release ships an `aarch64` DMG). Intel and
universal builds will follow from the app's CI release workflow.
