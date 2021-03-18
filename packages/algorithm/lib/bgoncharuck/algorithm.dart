import 'methods_base.dart';
// - - -
import '../interface.dart';
import '../astro.dart';
import '../astro_rome.dart';
import '../astro_jewish.dart';

// - - -
// astrology
part 'base_astrology.dart';
part 'base_astrology_numerologic.dart';
part 'base_astrology_tarot.dart';

const int DAYS_TO_COUNT_IN_POLLS = 7;
const TODAY_POLL_PERCENT = 10;

abstract class _OldWisdom {
  /// returned map must have values from 1 to 100
  Map<ProphecyType, ProphecyEntity> says(UserEntity aboutUser, int inTimeOf);
}

class OfOldWayMagic implements MagicSpecialization {
  //
  /// Cut the red line here! Here we go
  final _OldWisdom _mage = _Astrology();

  /// asks information from the Old Way adept mage
  Map<ProphecyType, ProphecyEntity> _askInformation(
          UserEntity aboutUser, int inTimeOf) =>
      _mage.says(aboutUser, inTimeOf);

  //
  /// Old Way Magic will use an information given by a mage and user choices
  /// to return a correct prophecy for a prophet, that asked for it
  Map<ProphecyType, ProphecyEntity> ask(AlgoData withDat, int aboutDay) {
    /// get information from the mage
    final mysticInfo = _askInformation(withDat.user, aboutDay);

    return mysticInfo;
  }
}
