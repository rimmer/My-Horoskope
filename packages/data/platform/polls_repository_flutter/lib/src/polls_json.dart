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

@JsonSerializable()
class PollsRepositoryJson extends PollsRepository {
  /// polls for currently loaded user
  Map<int, UserPoll> curUserPolls = {};

  @override
  Future<bool> save(int userid) async => await storage.write(
        // @TODO dart-json-stream-parser
        data: json.encode(this.toJson()),
        asFile: _fileLocation(userid),
      );

  @override
  Future<bool> load(int userid) async {
    try {
      final red = await storage.read(fromFile: _fileLocation(userid));

      if (red == null) return false;
      //

      final pollsFromFile = fromJson(json.decode(red)).curUserPolls;
      this.curUserPolls.addAll(pollsFromFile);
      return true;

      //
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
    return curUserPolls[dtDay];
  }

  @override
  set todayPoll(UserPoll newPoll) {
    curUserPolls[dtDay] = newPoll;
  }

  Map<String, Object> toJson() => _$PollsRepositoryJsonToJson(this);

  static PollsRepositoryJson fromJson(Map<String, Object> json) =>
      _$PollsRepositoryJsonFromJson(json);
}
