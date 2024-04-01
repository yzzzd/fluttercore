## 2.0.2 (2024-03)

Refactoring function on ``ApiObserver``

### ``run()`` with callback ie: onSuccess(), onError().
```dart
ApiObserver.withCalback()
ApiObserver.withDataCalback()
```

### ``runInline()`` become ``withFuture()``
```dart
final response = await ApiObserver.withFuture<LoginResponse>(api: () => _apiService.login(username, password), creator: () => LoginResponse('', null));
```

### ``runInlineData()`` become ``withDataFuture()``
```dart
final response = await ApiObserver.withDataFuture(api: () => _apiService.login(username, password));
```

## 2.0.1 (2024-02)

* Use your own class ``Response`` that should extends from ``ApiResponse`` to get single line hit API with ``runInline()`` function. The ``response`` object will **still** be of type ``Response`` even if there is an error response.

```dart
final response = await ApiObserver.runInline<LoginResponse>(api: () => _apiService.login(username, password), creator: () => LoginResponse('', null));

if (response.successed()) {
    // TODO: something.
} else {
    // TODO: something else.
}
```

* Alternate, you can use ``ApiDataResponse<T>`` to get single line hit API with ``runInlineData()`` function, if you don\'t want provide the ``creator function``

```dart
@POST('/login')
Future<ApiDataResponse<User>> login(
    @Field('username') String username, 
    @Field('password') String password 
);
```

```dart
final response = await ApiObserver.runInlineData(api: () => _apiService.login(username, password));

if (response.successed()) {
    // TODO: something.
} else {
    // TODO: something else.
}
```

## 2.0.0 (2024-02)

* Just starter for version 2.0.0 beta, included in README file