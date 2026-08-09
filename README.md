# anishfyi/homebrew-tap

Homebrew tap for my apps.

## Troy

A browser an agent can actually read and drive. [Source](https://github.com/anishfyi/troy) · [Site](https://anishfyi.com/troy).

```sh
brew tap anishfyi/tap
brew install --cask troy
```

Apple silicon and Intel, picked automatically.

Troy is ad-hoc signed but not notarised, which normally means Gatekeeper
blocks the first launch and you go hunting for the Control-click trick. The
cask clears the quarantine flag after installing, so `brew install` is the
whole story. That is the trade: installing from this tap is trusting the
source directly rather than trusting Apple's review of it.

## Pawse

The pomeranian that makes you take breaks. [Source](https://github.com/anishfyi/pawse) · [Site](https://anishfyi.github.io/pawse/).

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
