library polls_repository_flutter;

import 'package:polls_repository/polls_repository.dart';
import 'package:userpoll/userpoll.dart';

import 'src/polls_json.dart';
export 'src/polls_json.dart';

class PollsRepositoryFlutter extends PollsRepository {
  /// impl of polls repository
  /// can be changed in the future
  PollsRepository _impl = PollsRepositoryJson();

  List<UserPoll> get curUserPolls => _impl.curUserPolls;
  Future<bool> save(int userid) => _impl.save(userid);
  Future<bool> load(int userid) => _impl.load(userid);
  UserPoll get todayPoll => _impl.todayPoll;
}
