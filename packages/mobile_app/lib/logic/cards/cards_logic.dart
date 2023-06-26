import 'package:flutter/widgets.dart';

/// How it works
///
/// Initially, all cards were not shown, big card is empty and ads was not watched
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
class _CardsLogic extends ChangeNotifier {
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
  bool _adsWatched = false;
  bool get adsWatched => _adsWatched;
  set adsWatched(bool val) {
    _adsWatched = val;
    notifyListeners();
  }

  bool get dontShowAds => cardsShownCount() != (maxNumberOfCards - 1) || adsWatched;

  whenAdsWatched() {
    _adsWatched = true;
    cardShown[_choice] = true;
    notifyListeners();
  }

  /// current choise
  bool get currentBigCardIsEmpty => cardsShownCount() == 0;

  CardType _choice = CardType.NONE;
  CardType get choice => _choice;

  /// @SETTER
  set choice(CardType newChoice) {
    if (dontShowAds) {
      cardShown[newChoice] = true;
    }

    _choice = newChoice;
    notifyListeners();
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

const Map<CardType, String> cardTypeToString = {
  CardType.COLOR: "colors",
  CardType.NUMBER: "numbers",
  CardType.TARROT: "tarrot",
  CardType.GEM: "gems",
  CardType.TEXT: "text",
};

class CardsLogic extends InheritedWidget {
  CardsLogic({
    @required Widget child,
  }) : super(child: child);

  final _CardsLogic _bound = _CardsLogic();

  static _CardsLogic of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<CardsLogic>())._bound;

  @override
  bool updateShouldNotify(CardsLogic old) => false;
}
