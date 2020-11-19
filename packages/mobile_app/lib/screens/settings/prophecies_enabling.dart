part of 'screen.dart';

Column propheciesEnabling() {
  return Column(
    children: [
      _prophecyEnablingItem(
        text: lang.prophecyId['LUCK'],
        value: MutableBool(true),
        onChanged: (_) {},
      ),
      _prophecyEnablingItem(
        text: lang.prophecyId['MOODLET'],
        value: MutableBool(true),
        onChanged: (_) {},
      ),
      _prophecyEnablingItem(
        text: lang.prophecyId['AMBITION'],
        value: MutableBool(true),
        onChanged: (_) {},
      ),
      _prophecyEnablingItem(
        text: lang.prophecyId['INTELLIGENCE'],
        value: MutableBool(true),
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
