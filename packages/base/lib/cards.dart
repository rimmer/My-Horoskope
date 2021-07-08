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
    CardType.TREE: false,
    CardType.COIN: false,
    CardType.STAR: false,
    CardType.SWORD: false,
    CardType.CUP: false,
  };
  int cardsShownCount() =>
      (cardShown[CardType.TREE] ? 1 : 0) +
      (cardShown[CardType.COIN] ? 1 : 0) +
      (cardShown[CardType.STAR] ? 1 : 0) +
      (cardShown[CardType.SWORD] ? 1 : 0) +
      (cardShown[CardType.CUP] ? 1 : 0);

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
  TREE,
  COIN,
  STAR,
  SWORD,
  CUP,
  NONE,
}

const Map<CardType, ProphecyType> cardTypeToProphecy = {
  CardType.TREE: ProphecyType.ROOT,
  CardType.STAR: ProphecyType.SACRAL,
  CardType.SWORD: ProphecyType.SOLAR,
  CardType.CUP: ProphecyType.HEART,
  CardType.COIN: ProphecyType.THROAT,
};

const Map<CardType, String> cardTypeToString = {
  CardType.TREE: "tree",
  CardType.COIN: "coins",
  CardType.STAR: "star",
  CardType.SWORD: "sword",
  CardType.CUP: "cup",
};
