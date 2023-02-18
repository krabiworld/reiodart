# Ecosystem

Here are the rules to make your life easier.

> 1. [Rules for updating](https://github.com/MineEjo/reiodart/blob/master/.reio/ecosystem.md#rules-for-updating)
> 2. [Rules for creating](https://github.com/MineEjo/reiodart/blob/master/.reio/ecosystem.md#rules-for-creating)
> 3. [Rules for packages](https://github.com/MineEjo/reiodart/blob/master/.reio/ecosystem.md#rules-for-packages)

<br>

## Rules for updating

When updating data in [`./core/pubspec.yaml`](https://github.com/MineEjo/reiodart/blob/master/core/pubspec.yaml), update
the data in [`./core/lib/reio.dart`](https://github.com/MineEjo/reiodart/blob/master/core/lib/reio.dart).

<br>

## Rules for creating

`README.md`, which are **identical** to the [`README.md`](https://github.com/MineEjo/reiodart/blob/master/README.md):

> - [`./core/README.md`](https://github.com/MineEjo/reiodart/blob/master/core/README.md)


`LICENSE`, which are **identical** to the [`LICENSE`](https://github.com/MineEjo/reiodart/blob/master/LICENSE):

> - [`./core/LICENSE.md`](https://github.com/MineEjo/reiodart/blob/master/core/LICENSE)
> - [`./packages/router/LICENSE`](https://github.com/MineEjo/reiodart/blob/master/packages/router/LICENSE)

`example/README.md`, which are **identical** to
the [`example/README.md`](https://github.com/MineEjo/reiodart/blob/master/core/example/README.md):

> - [`./packages/router/example/README.md`](https://github.com/MineEjo/reiodart/blob/master/packages/router/example/README.md)

`.pubignore`, which are **identical** to
the [`.pubignore`](https://github.com/MineEjo/reiodart/blob/master/core/.pubignore):

> - [`./packages/router/.pubignore`](https://github.com/MineEjo/reiodart/blob/master/packages/router/.pubignore)

`analysis_options.yaml`, which are **identical** to
the [`analysis_options.yaml`](https://github.com/MineEjo/reiodart/blob/master/core/analysis_options.yaml):

> - [`./packages/router/analysis_options.yaml`](https://github.com/MineEjo/reiodart/blob/master/packages/router/analysis_options.yaml)

<br>

## [Rules for packages](https://github.com/MineEjo/reiodart/tree/master/packages)

### Readme

In the `README.md` of the official package, only the name, description and lack of ecosystem changes.

### Pubspec

Partial changes (compare regular and from some package), there are no special rules, except the version.

`Version style: <reio-version>+<package-version>`
`Example: 1.0.0+1.2.3`
