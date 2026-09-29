# velofy/homebrew-tap

Homebrew tap for my apps.

```sh
brew tap velofy/tap
```

## Trusting the tap

Homebrew asks you to trust a third-party tap before it will load a cask from
it. That gate is deliberate and it applies to everything here:

```sh
brew trust --cask velofy/tap/troy   # just this one cask
brew trust velofy/tap               # or the whole tap
```

Both of these casks install apps that are ad-hoc signed but not notarised by Apple,
and both clear the quarantine flag after installing so the first launch works
without the Control-click dance. That is the trade worth being explicit about:
you are trusting the source directly rather than trusting Apple's review of it.

## Troy

A browser an agent can actually read and drive. Real Chromium under its own
chrome, with refusals enforced in code and a debugging port an agent can attach
to. [Source](https://github.com/velofy/troy) · [Docs](https://velofy.co/troy/).

```sh
brew install --cask troy
```

Apple silicon and Intel, picked automatically.

## Pawse

The pomeranian that makes you take breaks.
[Source](https://github.com/velofy/pawse) · [Docs](https://velofy.co/pawse/).

```sh
brew install --cask pawse
```

Apple silicon and Intel, from one universal DMG. Needs macOS 11 (Big Sur) or later.

## Updating

```sh
brew update && brew upgrade --cask troy
```

## License

The casks here are MIT. Each app carries its own licence in its own repository.
