# Ecosystem

Here are the rules to make your life easier.

## Rules for updating

### Core

When updating data in [`./core/pubspec.yaml`](https://github.com/MineEjo/reiodart/blob/master/core/pubspec.yaml), update
the data in [`./core/lib/reio.dart`](https://github.com/MineEjo/reiodart/blob/master/core/lib/reio.dart).

## Rules of creation

### Core

`README.md`, which must be `identical`:

```text
./README.md
./core/README.md
```

<br>

`LICENSE`, which must be `identical`.

```text
./LICENSE
./core/LICENSE
```

### Packages

`LICENSE`, which must be as in the `./core`.

```text
./packages/router/LICENSE
```

`example/README.md`, which must be as in the `./core`.

```text
./packages/router/example/README.md
```

`.gitignore`, which must be as in the `./core`.

```text
./packages/router/.gitignore
```

`.pubignore`, which must be as in the `./core`.

```text
./packages/router/.pubignore
```

`analysis_options.yaml`, which must be as in the `./core`.

```text
./packages/router/analysis_options.yaml
```

`pubspec.yaml`, must be `similar` to `./core`.

```text
./packages/router/pubspec.yaml
```

`README.md`, must be `similar` to `./core`.

```text
./packages/router/README.md
```

`CHANGELOG.md`, which must be `identical`.

```text
./packages/router/CHANGELOG.md
```
