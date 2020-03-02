# docs

Section documentation at https://www.section.io/docs

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

### Production

To create a build environment, run:

```
make build
```

To generate the static site, run:

```
make generate
```

This will build the site and publish the output into `public/`.

To deploy the site to production, run:

```
make deploy
```

Changes are deployed by the Jenkins roughly every 5 minutes.

The version of Hugo used to build the production site is in the `Dockerfile`.

You can inspect the build environment by running:

```
make inspect
```
