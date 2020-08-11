import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:polls_repository/polls_repository.dart';
import 'package:userpoll/userpoll.dart';
import 'package:storage_access/storage_access.dart' as storage;
import 'package:int_datetime/int_datetime.dart';

part 'polls_json.g.dart';

/// implements polls repository
/// using json and storage_access flutter package
///
/// prophecies saved independent for every user
/// by user id

/// prefix and suffix for file name, which will save
/// prophecies by user id
const userPollsFileNamePrefix = "userpolls_";
const userPollsFileNameSuffix = ".json";

/// returns file name by given user id
String _fileLocation(int userid) =>
    "$userPollsFileNamePrefix$userid$userPollsFileNameSuffix";

class PollsRepositoryFlutter implements PollsRepository {
  /// polls for currently loaded user
  List<UserPoll> curUserPolls = [];

  @override
  Future<bool> save(int userid) async => (curUserPolls.isNotEmpty)
      ? await storage.write(
          data: json.encode(curUserPolls.toJson()),
          asFile: _fileLocation(userid),
        )
      : false;

  @override
  Future<bool> load(int userid) async {
    try {
      final red = await storage.read(fromFile: _fileLocation(userid));
      if (red != null) {
        curUserPolls.fromJson(json.decode(red));
        return true;
      } else
        return false;
    } catch (_) {
      return false;
    }
  }

  /// gets milliseconds since UNIX epoch
  /// for the start of current day
  ///
  /// and tries to find it in the list of user polls
  @override
  UserPoll get todayPoll {
    final today = dtDay;
    return curUserPolls.firstWhere((el) => el.dt == today) ?? null;
  }
}

extension Json on List<UserPoll> {
  Map<String, Object> toJson() => _UserPollListWrapper(this).toJson();
  fromJson(Map<String, Object> json) {
    final wrapper = _UserPollListWrapper.fromJson(json);
    this.clear();
    this.addAll(wrapper.wrapped);
  }
}

@JsonSerializable()
class _UserPollListWrapper {
  List<UserPoll> wrapped;
  _UserPollListWrapper(this.wrapped);

  Map<String, Object> toJson() => _$_UserPollListWrapperToJson(this);

  static _UserPollListWrapper fromJson(Map<String, Object> json) =>
      _$_UserPollListWrapperFromJson(json);
}
