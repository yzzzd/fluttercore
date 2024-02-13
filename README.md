<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# FlutterCore ``2.beta (lite version)``
FlutterCore make you get the most rapid development.

## Features

- MVVM Architecture
- Simplify API Callback
- Utilities

## Changelog

Read the [CHANGELOG](https://github.com/yzzzd/fluttercore/blob/main/CHANGELOG.md) to find out what's included in the latest update!

## Getting started

Add this dependency to your package's pubspec.yaml (and run flutter pub get):

```yaml
dependencies:
  flutter_core:
    git:
      url: https://github.com/yzzzd/fluttercore.git
      ref: beta
```

## Usage

### 1. CoreApp
```dart
void main() {
  runApp(const App());
}

class App extends CoreApp{
  const App({super.key});

  @override
  Widget initialScreen() {
    // initial screen goes here
    return const HomeScreen();
  }

  @override
  Bindings initialBinding() {
    // initial binding or dependency injection goes here
    return AppBinding();
  }
}
```

### 2. View & ViewModel
Your ``Screen`` class should be extends from ``CoreScreen`` to get View and ViewModel implementation

```dart
class HomeScreen extends CoreScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold();
  }
}
```

Also your ``ViewModel`` class should be extends from ``CoreViewModel``. You will able to use ``update();`` or ``Collectable<T>`` data state.
```dart
class HomeViewModel extends CoreViewModel
```

### 3. Observe Data
```dart
// in ViewModel
Collectable<int> favorite = Collectable(0);

// do operation
favorite.value += 1;

// in Screen
Collect(() => Text('Total favorites: ${viewModel.favorite}'))

// OR

// in ViewModel
var favorite = 0;

// do operation
favorite += 1;
update();

// in Screen
CollectBuilder<HomeViewModel>(
  builder: (viewModel) => Text('Total favorites: ${viewModel.favorite}')
)
```

## Additional information

FlutterCore still under beta development, any insight feel free to contact. Thanks.
