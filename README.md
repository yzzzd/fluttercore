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

# FlutterCore ``2.beta`` (lite version)

FlutterCore make you get the most rapid development.

## Features

- MVVM Architecture
- Simplify API Callback
- Get Lifecycle
- Helper & Utilities
- Suggest more... lets [contribute](https://github.com/yzzzd/fluttercore/fork)!

## Changelog

Read the [CHANGELOG](https://github.com/yzzzd/fluttercore/blob/main/CHANGELOG.md) to find out what's included in the latest update!

## Getting started

Add this dependency to your package's pubspec.yaml (and run flutter pub get):

```yaml
dependencies:
  flutter_core:
    git:
      url: https://github.com/yzzzd/fluttercore.git
      ref: {latest_release}
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
  Widget initialScreen() => const WelcomeScreen(); // initial screen goes here

  @override
  Bindings initialBinding() => AppBinding(); // initial binding dependency goes here
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

#### for ``List`` data

```dart
// use CollectableList
CollectableList<Fruit> fruits = CollectableList([]);

// then you need call refresh() if you change value of Fruit / not the list
fruits[index].flavour = 'Sweet';
fruits.refresh();

// or you don't need to call refresh(), but you should use List data and call update(), then use Builder to update the Screen.
```

### 4. Route Management

With wrapping ``CoreApp`` before, then define the routes in ``getPages()`` override.

```dart
@override
List<GetPage> getPages() => [
  GetPage(
    name: HomeScreen.routeName,
    page: () => const HomeScreen(),
    binding: BindingsBuilder(() {
      Get.lazyPut(() => HomeViewModel());
    })
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => const LoginScreen(),
    binding: BindingsBuilder(() {
      Get.lazyPut(() => LoginViewModel());
    })
  )
].toList();
```

### Navigation

To navigate to next screen

```dart
Get.toNamed('/ProductDetailScreen');
```

To navigate and remove the previous screen from the tree.

```dart
Get.offNamed('/HomeScreen');
```

To navigate and remove all previous screens from the tree.

```dart
Get.offAllNamed('/LoginScreen');
```

### 5. API Call
_\*MAY DEPRECATED\* So please refer from CHANGELOG for latest way_

### Prepare your ``Response``

Example of ``LoginResponse`` extend from ``ApiResponse`` which have basic respon api properties like: ``code``, ``message``. You can simply add the required properties following on your api response needs.

```dart
@JsonSerializable()
class LoginResponse extends ApiResponse {
  @JsonKey(name: 'data')
  User user;
}
```

### Prepare your ``ApiService``

```dart
@POST('/login')
Future<LoginResponse> login(
  @Field('username') String username, 
  @Field('password') String password 
);
```

### Hit with ``ApiObserver.run()`` function 

```dart
ApiObserver.run<LoginResponse>(
  api: () => _apiService.login(username, password),
  onSuccess: (response) async {
    await _userDao.saveLoginUser(response.user);
    dismissDialog();
    Get.offAllNamed(HomeScreen.routeName);
  },
  onError: (response) => showDialog(message: response.message)
);
```
## Additional information

FlutterCore still under beta development, any insight feel free to contact. Thanks.
