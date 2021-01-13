library polls_repository;

import 'package:poll_model/poll_model.dart';
import 'package:userpoll/userpoll.dart';

/// interface for a repository of polls that loaded and saved by user id

abstract class PollsRepository {
  /// empty list or loaded polls for a user id
  List<UserPoll> get curUserPolls;

  /// loads or save **all** user poles by user id from whatever implemented in `data`/`platform`
  Future<bool> save(int userid);
  Future<bool> load(int userid);

  /// is a current day poll
  UserPoll get todayPoll;
  void set todayPoll(UserPoll newPoll);

//--------------------------------------------------------------------------
  /// returns arithmetic mean of values of polls
  Map<PollModelType, double> arithmeticMean(int days) {
    /// ignore today poll if voted
    UserPoll saved = this.todayPoll;
    if (saved != null) curUserPolls.removeLast();

    final lengthOfUserPolls = curUserPolls.length;

    /// case lengthOfUserPolls ==  0
    if (lengthOfUserPolls == 0) return null;

    /// for all other cases
    /// gets a count of poll details
    final detailsCount = curUserPolls[0].details.length;
    int mood = 0;
    List<int> details = List(detailsCount);

    /// case lengthOfUserPolls <= days
    if (lengthOfUserPolls <= days)
      for (UserPoll poll in curUserPolls) {
        mood += poll.mood.value;
        poll.accamulateDetails(details);
      }

    /// case lengthOfUserPolls > days
    else if (lengthOfUserPolls > days) {
      for ( //
          int indexOfCurPoll = lengthOfUserPolls - 1;
          indexOfCurPoll >= lengthOfUserPolls - days;
          indexOfCurPoll--
          //
          ) {
        final poll = curUserPolls[indexOfCurPoll];
        //
        mood += poll.mood.value;
        poll.accamulateDetails(details);
      }
    }

    /// after sum
    final anyPoll = curUserPolls[0];

    /// add today's poll back
    if (saved != null) curUserPolls.add(saved);

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
