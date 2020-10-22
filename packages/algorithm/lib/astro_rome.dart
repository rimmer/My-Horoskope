// all astrology was created for this months
// and now we have 12, not 10 months
// it is a quite stupid problem
// enum RomMonAncient {
//   Martius,
//   Aprilis,
//   Maius,
//   Junius,
//   Quintilis,
//   Sextilis,
//   September,
//   October,
//   November,
//   December,
// None,
// }

enum RomGod {
  None,
  Mars,
  Venus,
  Mercury,
  Luna,
  Helios,
  Pluto,
  Jupiter,
  Saturn,
  Uranus,
  Neptune,
}

// this relation is best, but we can't use it
// const AncientRomMonthToGod = {
//   RomMonAncient.Martius: RomGod.Mars,
//   RomMonAncient.Aprilis: RomGod.Venus,
//   RomMonAncient.Maius: RomGod.Mercury,
//   RomMonAncient.Junius: RomGod.Luna,
//   RomMonAncient.Quintilis: RomGod.Helios,
//   RomMonAncient.Sextilis: RomGod.Uranus,
//   RomMonAncient.September: RomGod.Neptune,
//   RomMonAncient.October: RomGod.Pluto,
//   RomMonAncient.November: RomGod.Jupiter,
//   RomMonAncient.December: RomGod.Saturn,
// };

// we cant use it too, because calendar was shifted in XV century
// const RomMonthToGodJulianCalendar = {
// RomMon.Martius: RomGod.Mars,
// RomMon.Aprilis: RomGod.Venus,
// RomMon.Maius: RomGod.Mercury,
// RomMon.Iunius: RomGod.Luna,
// RomMon.Quintilis: RomGod.Helios,
// Mercury used again because 2 months were added
// and romans did not approve new gods with unique months
// RomMon.Sextilis: RomGod.Mercury,
// same with Venus
// RomMon.September: RomGod.Venus,
// RomMon.October: RomGod.Pluto,
// RomMon.November: RomGod.Jupiter,
// RomMon.December: RomGod.Saturn,
// RomMon.Ianuarius: RomGod.Uranus,
// RomMon.Februarius: RomGod.Neptune,
// };

/// Month names have incorrect relationship
/// to the God's name and Greek/Rome astrology
/// but, this is what we use, because of
/// 2 calendar changes
const RomMonthToGod = {
  RomMon.Martius: RomGod.Neptune,
  RomMon.Aprilis: RomGod.Mars,
  RomMon.Maius: RomGod.Venus,
  RomMon.Iunius: RomGod.Mercury,
  RomMon.Quintilis: RomGod.Luna,
  RomMon.Sextilis: RomGod.Helios,
  RomMon.September: RomGod.Mercury,
  RomMon.October: RomGod.Venus,
  RomMon.November: RomGod.Pluto,
  RomMon.December: RomGod.Jupiter,
  RomMon.Ianuarius: RomGod.Saturn,
  RomMon.Februarius: RomGod.Uranus,
};

/// Julian Calendar Names
enum RomMon {
  Ianuarius,
  Februarius,
  Martius,
  Aprilis,
  Maius,
  Iunius,
  Quintilis,
  Sextilis,
  September,
  October,
  November,
  December,
}

extension RomePatron on DateTime {
  RomGod get patron {
    //

    RomMon patron = RomMon.December;

    switch (this.month) {
      case 1:
        patron = RomMon.Ianuarius;
        break;

      case 2:
        patron = RomMon.Februarius;
        break;

      case 3:
        patron = RomMon.Martius;
        break;

      case 4:
        patron = RomMon.Aprilis;
        break;

      case 5:
        patron = RomMon.Maius;
        break;

      case 6:
        patron = RomMon.Iunius;
        break;

      case 7:
        patron = RomMon.Quintilis;
        break;

      case 8:
        patron = RomMon.Sextilis;
        break;

      case 9:
        patron = RomMon.September;
        break;

      case 10:
        patron = RomMon.October;
        break;

      case 11:
        patron = RomMon.November;
        break;

      case 12:
      default:
        break;
    }

    return RomMonthToGod[patron];
  }
}
