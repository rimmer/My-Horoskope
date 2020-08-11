library polls_repository;

import 'package:userpoll/userpoll.dart';

/// interface for a repository of polls that loaded and saved by user id

abstract class PollsRepository {
  /// empty list or loaded polls for a user id
  List<UserPoll> curUserPolls;

  /// loads or save **all** user poles by user id from whatever implemented in `data`/`platform`
  Future<bool> save(int userid);
  Future<bool> load(int userid);

  /// is a current day poll
  UserPoll get todayPoll;
}
