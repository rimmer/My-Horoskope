# Users repository, abstract module

Interface for user entity and data controller based on this entity.

Data controller use a repository pattern.

### Library name: `users_repository`

# User Entity
- final `int` id;
- var `UserRole` role;
- var `UserModel` model;
- var `List<UserEntity>` ambiance;

- var `bool` lastLogin;
    if this user was logged previous app start

##### Constructor : 
```
  UserEntity({
    id,
    this.role = UserRole.USER,
    this.ambiance = const [],
    this.lastLogin = false,
    @required this.model,
  }) : this.id = id ?? model.hashCode;
```

`UserModel` is a [model](https://github.com/rimmer/my_prophet/tree/master/packages/models/README.md)

`UserRole` is `enum` :
```
  NONE,
  USER,
  SOULMATE,
  FRIEND,
```
more roles may be added in the future

# User Repository

`abstract class UsersRepository`

---

add(`UserEntity` user)

delete(`UserEntity` user)

    adds or removes user from the local stroage. 


List<`UserEntity`> get users

    Actual list of users

`UserEntity` get(int id)

    get user by id

`UserEntity` get current

    get current user if registred

void logoutIfAny()

    changes boolean lastLogin of any loaded user to false, 

`UserEntity` loginIfAny(int id)

    if user that wants to register already esit in base, load him as current and give true to bolean lastLogin

Future<bool> write()

    writes changes to whatever implementation is

Future<bool> prepare()

    prepare repository by loading and configuring data from whatever implementation is