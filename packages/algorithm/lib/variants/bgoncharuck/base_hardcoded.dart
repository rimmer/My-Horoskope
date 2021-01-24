part of 'algorithm.dart';

class _Hardcoded implements _OldWisdom {
  Map<ProphecyType, ProphecyEntity> says(UserEntity aboutUser, int inTimeOf) =>
      {
        ProphecyType.INTERNAL_STRENGTH:
            ProphecyEntity(id: ProphecyType.INTERNAL_STRENGTH, value: 49),
        ProphecyType.MOODLET:
            ProphecyEntity(id: ProphecyType.MOODLET, value: 65),
        ProphecyType.AMBITION:
            ProphecyEntity(id: ProphecyType.AMBITION, value: 90),
        ProphecyType.INTUITION:
            ProphecyEntity(id: ProphecyType.INTUITION, value: 53),
        ProphecyType.LUCK: ProphecyEntity(id: ProphecyType.LUCK, value: 70),
      };
}
