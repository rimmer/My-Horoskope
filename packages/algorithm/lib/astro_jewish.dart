enum TarotSuit { Wands, Pentacles, Swords, Cups }

TarotSuit elementToTarotSuit(String element) {
  TarotSuit suit;

  if (element == "Fire")
    suit = TarotSuit.Wands;
  else if (element == "Earth")
    suit = TarotSuit.Pentacles;
  else if (element == "Air")
    suit = TarotSuit.Swords;
  else if (element == "Water") suit = TarotSuit.Cups;

  return suit;
}
