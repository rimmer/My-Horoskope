part of 'screen.dart';

class PropheciesEnabling extends StatelessWidget {
  final MutableBool luck;
  final MutableBool internalStrength;
  final MutableBool moodlet;
  final MutableBool ambition;
  final MutableBool intelligence;

  const PropheciesEnabling({
    @required this.luck,
    @required this.internalStrength,
    @required this.moodlet,
    @required this.ambition,
    @required this.intelligence,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _ProphecyEnablingItem(
            text: localeText.prophecyId['LUCK'],
            value: luck,
            onChanged: (_) {},
          ),
          _ProphecyEnablingItem(
            text: localeText.prophecyId['INTERNAL_STRENGTH'],
            value: internalStrength,
            onChanged: (_) {},
          ),
          _ProphecyEnablingItem(
            text: localeText.prophecyId['MOODLET'],
            value: moodlet,
            onChanged: (_) {},
          ),
          _ProphecyEnablingItem(
            text: localeText.prophecyId['AMBITION'],
            value: ambition,
            onChanged: (_) {},
          ),
          _ProphecyEnablingItem(
            text: localeText.prophecyId['INTUITION'],
            value: intelligence,
            onChanged: (_) {},
          ),
        ],
      );
}

class _ProphecyEnablingItem extends StatelessWidget {
  final String text;
  final MutableBool value;
  final Function(bool) onChanged;

  const _ProphecyEnablingItem(
      {@required this.text, @required this.value, @required this.onChanged});

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Text(
          text,
          style: AppTextStyle.labelText,
        ),
        trailing: MagicCheckbox(
          value: value,
          onChanged: onChanged,
        ),
      );
}
