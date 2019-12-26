# docs

Section documentation at https://section.io/docs

## Dependencies

The website is built with Hugo.

Make sure you have [Hugo](https://gohugo.io/getting-started/installing/) installed on your system.

If you are using macOS and [Homebrew](https://brew.sh), you can set up your development environment by running:

``` bash
brew bundle --file=Brewfile.development
```

## Setup

Clone the repository and all the needed bits by running:

``` bash
git clone --recursive https://github.com/section-io/docs.git
```

(We use a Hugo theme, which lives as a git submodule under `themes/`)

## Local dev

Start a local instance of the website by running:

``` bash
hugo server
```

The output will tell you what port the website is running on, but it should almost always be running at http://localhost:1313/

Hugo will automatically rebuild and reload the website when you make changes.

## Publishing changes

Make your changes locally, then submit a PR on GitHub.

## Known issues

1. You might need to change remote url for push:

   ```
   git remote set-url origin git@github.com:section-io/docs.git
   ```

1. You might want to disable fast rendering:

   ```
   hugo server --watch --disableFastRender
   ```
