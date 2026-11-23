# P-chan Tap

## How do I install these formulae?

`brew install p-chan/tap/<formula>`

Or `brew tap p-chan/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "p-chan/tap"
brew "<formula>"
```

## How are formulae updated?

The `brew bump` workflow checks for new versions every hour and opens a pull request for each outdated formula. The pull request merges automatically once the tests pass.

To check right away, for example just after a release, run the workflow manually:

```sh
# All formulae
gh workflow run autobump.yml -R p-chan/homebrew-tap

# Specific formulae (space-separated)
gh workflow run autobump.yml -R p-chan/homebrew-tap -f formulae=mxm
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
