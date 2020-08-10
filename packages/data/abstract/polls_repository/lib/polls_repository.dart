library polls_repository;

import 'package:userpoll/userpoll.dart';

abstract class PollsRepository {
  List<UserPoll> curUserPolls;

  Future<bool> save(int userid);
  Future<bool> load(int userid);

  UserPoll get todayPoll;
}
