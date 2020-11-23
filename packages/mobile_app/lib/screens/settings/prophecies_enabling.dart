part of 'screen.dart';

Column propheciesEnabling({
  @required MutableBool luck,
  @required MutableBool internalStrength,
  @required MutableBool moodlet,
  @required MutableBool ambition,
  @required MutableBool intelligence,
}) {
  return Column(
    children: [
      _prophecyEnablingItem(
        text: lang.prophecyId['LUCK'],
        value: luck,
        onChanged: (_) {},
      ),
      _prophecyEnablingItem(
        text: lang.prophecyId['INTERNAL_STRENGTH'],
        value: internalStrength,
        onChanged: (_) {},
      ),
      _prophecyEnablingItem(
        text: lang.prophecyId['MOODLET'],
        value: moodlet,
        onChanged: (_) {},
      ),
      _prophecyEnablingItem(
        text: lang.prophecyId['AMBITION'],
        value: ambition,
        onChanged: (_) {},
      ),
      _prophecyEnablingItem(
        text: lang.prophecyId['INTELLIGENCE'],
        value: intelligence,
        onChanged: (_) {},
      ),
    ],
  );
}

ListTile _prophecyEnablingItem(
        {@required String text,
        @required MutableBool value,
        @required Function(bool) onChanged}) =>
    ListTile(
      leading: Text(
        text,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
        ),
      ),
      trailing: MagicCheckbox(
        value: value,
        onChanged: onChanged,
      ),
    );
