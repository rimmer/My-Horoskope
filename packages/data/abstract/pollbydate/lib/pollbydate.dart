library pollbydate;

export 'src/pollbydate.dart';
import 'src/pollbydate.dart';

import 'package:meta/meta.dart';
import 'package:userpoll/userpoll.dart';

abstract class PollByDateRepository {
  PollByDate currentUserPolls;

  Future<bool> save(int userid);
  Future<bool> load(int userid);

  // add poll by datetime, if it already exists, return previous UserPoll
  UserPoll add({@required int dt, @required UserPoll poll});

  UserPoll get todayPoll;
}
