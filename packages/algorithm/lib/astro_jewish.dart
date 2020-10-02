enum TarotSuit { Wands, Pentacles, Swords, Cups }

TarotSuit elementToTarotSuit(String element) {
  if (element == "Fire")
    return TarotSuit.Wands;
  else if (element == "Earth")
    return TarotSuit.Pentacles;
  else if (element == "Air")
    return TarotSuit.Swords;
  else if (element == "Water") return TarotSuit.Cups;
}
