library polls_repository;

import 'package:poll_model/poll_model.dart';
import 'package:userpoll/userpoll.dart';

/// interface for a repository of polls that loaded and saved by user id

abstract class PollsRepository {
  /// empty list or loaded polls for a user id
  Map<int, UserPoll> get curUserPolls;

  /// loads or save **all** user poles by user id from whatever implemented in `data`/`platform`
  Future<bool> save(int userid);
  Future<bool> load(int userid);

  /// is a current day poll
  UserPoll get todayPoll;
  void set todayPoll(UserPoll newPoll);

//--------------------------------------------------------------------------
  /// returns arithmetic mean for every poll type (mood, productivity, etc) of every poll
  Map<PollModelType, double> arithmeticMean(int days) {
    //
    if (curUserPolls.isEmpty) return null;

    /// for all other cases
    /// gets a count of poll details

    /// we need to know how many other polls except mood we have
    /// so we choose any poll and count its details
    final anyPoll = curUserPolls.values.toList()[0];
    final detailsCount = anyPoll.details.length;

    /// then create placeholders for accamulation of poll values
    List<int> details = List(detailsCount);
    int mood = 0;

    /// if they are equal, then nothing to sum
    final lengthOfUserPolls = curUserPolls.length;
    int unvoted = 0;

    /// case lengthOfUserPolls <= days
    if (lengthOfUserPolls <= days)
      for (UserPoll poll in curUserPolls.values) {
        if (poll.voted == true) {
          mood += poll.mood.value;
          poll.accamulateDetails(details);
        } else
          unvoted++;
      }

    /// case lengthOfUserPolls > days
    else if (lengthOfUserPolls > days) {
      /// the most recent N dates will be the highest integers of dt
      /// so we sort it, and get the biggest N of them
      final indexes = curUserPolls.keys.toList()
        ..sort()
        ..getRange(lengthOfUserPolls - (days + 1), lengthOfUserPolls - 1);
      ;
      //
      for (int index in indexes) {
        final poll = curUserPolls[index];
        //
        if (poll.voted == true) {
          mood += poll.mood.value;
          poll.accamulateDetails(details);
        } else
          unvoted++;
      }
    }

    if (unvoted == lengthOfUserPolls) return null;

    /// after sum
    return {
      //
      PollModelType.MOOD: mood / days,
      PollModelType.RELATIONSHIPS:
          details[anyPoll.pollIndx(PollModelType.RELATIONSHIPS)] / days,
      PollModelType.PHYSICAL_ACTIVITY:
          details[anyPoll.pollIndx(PollModelType.PHYSICAL_ACTIVITY)] / days,
      PollModelType.PRODUCTIVITY:
          details[anyPoll.pollIndx(PollModelType.PRODUCTIVITY)] / days,
      PollModelType.SELFDEVELOPMENT:
          details[anyPoll.pollIndx(PollModelType.SELFDEVELOPMENT)] / days,
      //
    };
  }
}
