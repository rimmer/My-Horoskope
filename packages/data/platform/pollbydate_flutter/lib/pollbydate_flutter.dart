library pollbydate_flutter;

import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:pollbydate/pollbydate.dart';
import 'package:userpoll/userpoll.dart';
import 'package:storage_access/storage_access.dart' as storage;
import 'package:int_datetime/int_datetime.dart';

const userPollsFileNamePrefix = "userpolls_";
const userPollsFileNameSuffix = ".json";

String _fileLocation(int userid) =>
    "$userPollsFileNamePrefix$userid$userPollsFileNameSuffix";

class PollByDateRepositoryFlutter implements PollByDateRepository {
  PollByDate currentUserPolls;

  @override
  Future<bool> save(int userid) async => (currentUserPolls.date.isNotEmpty)
      ? await storage.write(
          data: json.encode(currentUserPolls.toJson()),
          asFile: _fileLocation(userid),
        )
      : false;

  @override
  Future<bool> load(int userid) async {
    try {
      final red = await storage.read(fromFile: _fileLocation(userid));
      if (red != null) {
        final redPolls = PollByDate.fromJson(json.decode(red)).date;
        currentUserPolls.date.addAll(redPolls);
        return true;
      } else
        return false;
    } catch (_) {
      return false;
    }
  }

  @override
  // add poll by datetime, if it already exists, return previous UserPoll
  UserPoll add({@required int dt, @required UserPoll poll}) {
    final previousPoll = currentUserPolls.date[dt];
    currentUserPolls.date[dt] = poll;
    return previousPoll;
  }

  @override
  UserPoll get todayPoll {
    final today = dtDay;
    return currentUserPolls.date[today];
  }
}
