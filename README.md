# P-Chan Homebrew Tap

## How do I install these packages?

Homebrew only loads formulae and casks from taps you trust, so trust this tap first:

```sh
brew tap p-chan/tap
brew trust --tap p-chan/tap
```

Then install a cask with `brew install --cask <cask>`, for example `brew install --cask mxm`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "p-chan/tap"
cask "<cask>"
```

## How are packages updated?

The `brew bump` workflow checks for new versions every hour and opens a pull request for each outdated formula or cask. The pull request merges automatically once the tests pass.

To check right away, for example just after a release, run the workflow manually:

```sh
# All formulae and casks
gh workflow run autobump.yml -R p-chan/homebrew-tap

# Specific formulae or casks (space-separated)
gh workflow run autobump.yml -R p-chan/homebrew-tap -f formulae=mxm
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
