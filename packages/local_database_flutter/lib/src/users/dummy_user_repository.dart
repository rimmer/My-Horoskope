import 'user_repository.dart';

class DumyUserRepository implements UserRepository {
  DumyUserRepository();

  Future<bool> isAuthenticated() async {
    // @DEBUG
    // return true;
    return false;
  }

  Future<void> authenticate() async {}

  Future<String> getUserId() async {
    return "magic";
  }
}