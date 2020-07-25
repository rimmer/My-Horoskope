## User Model

user model store basic user information like a name and birthdate

### Library name: `user_model`

## Fields:
- `String` name
- `int` birth
- `int` sex
- `String` country
- `String` place

## Constructor:
```
UserModel({
    @required this.name,
    @required this.birth,
    @required this.sex,
    @required this.country,
    @required this.place
});
```