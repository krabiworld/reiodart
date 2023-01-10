## About

Reio.dart is a progressive Dart library for creating UI on the web. Create your UI in minutes!

* Zero dependence;
* Flexible components;
* Virtual DOM;
* Reactivity;

## Quick links
* [Getting started](https://github.com/MineEjo/reiodart/wiki)
* [Package](https://pub.dev/packages/reio)

## Example

```dart
import 'components/app.reio.dart';

void main() {
  $App();
}
```

## Reactive stores

Stores are used to interact and store information. They are responsible for reactivity in components.

```dart
Watcher watcher = Watcher();

watcher.watch(() {
  print('Congratulations, you have ${store['clicks']?.get()} clicks!');
});
```

## HTML

```dart
div('value', [
        'id cool-element',
        'class first second etc'
      ], [
        div(),
        span(),
        $Component({})
      ], {
        'onMount': () => print('Yep!'),
        'onDestroy': () => print('Nope!')
      })
```

## Styles

The syntax is almost the same as standard CSS, but has the ability to use access modifiers.

* `public` - It makes element styles global, which is an alternative to `global.css`. Use the public modifier if this is the only way and if the element styles refer to a component, otherwise use `global.css`.
* `private` - Restricts access to element styles to everyone except the component `itself`. Does not require an element to be specified after the modifier.
* `Restricts` access to element styles other than the component `itself` and `its children`.

**Example:**

```css
{public}: body {
  color: black;
}

{private}: {
  color: white;
}

{protected}: div {
  color: blue;
}
```