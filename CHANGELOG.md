## 2.0.0 (2024-02)

* Just starter for version 2.0.0 beta, included in README file

## 2.0.1 (2024-02)

* Use ``ApiDataResponse<T>`` to get single line hit API with ``runInlineData()`` function

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