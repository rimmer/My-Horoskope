## Auth data controller

Is interface that used by BLoC to control user authentication.

It based on [users_repository module](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/users_repository/README.md)

# Auth interface

`abstract class Auth` 

---

[`UserEntity`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/users_repository/README.md#user-entity) curUser

    current authenticated UserEntity

Future<bool> get isAuthenticated

    if any user is authenticated, used to check if registration completed by BLoC

Future<[`UserEntity`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/users_repository/README.md#user-entity)> get initialize

    initialization events on users_repository

Future<[`UserEntity`](https://github.com/rimmer/my_prophet/tree/master/packages/data/abstract/users_repository/README.md#user-entity)> authenticate(UserModel mode)

    authentication methods on users_repository


