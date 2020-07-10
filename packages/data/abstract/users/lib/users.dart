library users;

import 'src/user.dart';
export 'src/user.dart';

abstract class Users {
  add(User user);

  delete(User user);

  update(User user);

  List<User> get users;

  User get(String id);
}
