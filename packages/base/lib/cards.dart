import 'package:base/prophecy/entity/prophecy.dart';

/// How it works
///
/// Initialy, all cards were not shown, big card is empty and ads was not watched
///
/// ---
///
/// **If user clicked on some card, you must send it's type to the setter "choise"**
///
/// If condition "dont show ads" is true, then this card type marked as true
/// inside "cardShown" map,
///
/// if not - it will mark boolean toBuildAds as true
///
/// in both paths field "_choise" will save card type that was just sent
///
/// ---
///
/// **after ads watched (if needed), you need to call "whenAdsWatched()"**
///
/// it will mark "adsWatched" as true and "toBuildAds" as false
///
/// also it will mark current "_choise" as true
/// inside "cardShown" map,
class Cards {
  int maxNumberOfCards = 5;

  /// booleans to know if some card was chosen once
  final Map<CardType, bool> cardShown = {
    CardType.COLOR: false,
    CardType.NUMBER: false,
    CardType.TARROT: false,
    CardType.GEM: false,
    CardType.TEXT: false,
  };
  int cardsShownCount() =>
      (cardShown[CardType.COLOR] ? 1 : 0) +
      (cardShown[CardType.NUMBER] ? 1 : 0) +
      (cardShown[CardType.TARROT] ? 1 : 0) +
      (cardShown[CardType.GEM] ? 1 : 0) +
      (cardShown[CardType.TEXT] ? 1 : 0);

  /// ads part
  bool adsWatched = false;
  bool get dontShowAds =>
      cardsShownCount() != (maxNumberOfCards - 1) || adsWatched;

  bool toBuildAds = false;
  whenAdsWatched() {
    adsWatched = true;
    toBuildAds = false;
    cardShown[_choise] = true;
  }

  /// current choise
  bool get currentBigCardIsEmpty => cardsShownCount() == 0;

  CardType _choise = CardType.NONE;
  CardType get choise => _choise;

  /// @SETTER
  set choise(CardType newChoise) {
    if (dontShowAds || cardShown[newChoise]) {
      toBuildAds = false;
      cardShown[newChoise] = true;
    } else {
      toBuildAds = true;
    }

    _choise = newChoise;
  }

  restart() {
    _cards = Cards._();
  }

  /// singleton constructor
  Cards._();
  static Cards _cards;
  factory Cards() {
    if (_cards == null) _cards = Cards._();
    return _cards;
  }
}

enum CardType {
  COLOR,
  NUMBER,
  TARROT,
  GEM,
  TEXT,
  NONE,
}

const Map<CardType, ProphecyType> cardTypeToProphecy = {
  CardType.COLOR: ProphecyType.ROOT,
  CardType.TARROT: ProphecyType.SACRAL,
  CardType.GEM: ProphecyType.SOLAR,
  CardType.TEXT: ProphecyType.HEART,
  CardType.NUMBER: ProphecyType.THROAT,
};

const Map<CardType, String> cardTypeToString = {
  CardType.COLOR: "colors",
  CardType.NUMBER: "numbers",
  CardType.TARROT: "tarrot",
  CardType.GEM: "gems",
  CardType.TEXT: "text",
};
