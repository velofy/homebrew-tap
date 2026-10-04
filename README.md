# velofy/homebrew-tap

Homebrew tap for Velofy's macOS apps.

```sh
brew tap velofy/tap
brew trust velofy/tap
brew install --cask troy
```

Homebrew 7.0 refuses to load casks from a third-party tap until you trust it, so
`brew trust` is required once per tap. Without it you get
`Refusing to load cask velofy/tap/troy from untrusted tap velofy/tap`.

## Casks

| Cask | What it is |
| --- | --- |
| `troy` | A browser an agent can read and drive. [troy.velofy.co](https://troy.velofy.co/) |
| `pawse` | The pomeranian that makes you take breaks. |

Install either with `brew install --cask <name>` once the tap is trusted.
