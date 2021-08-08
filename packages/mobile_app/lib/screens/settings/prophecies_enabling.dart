part of 'settings_screen.dart';

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
            text: localeText.prophecyId['SACRAL'],
            value: luck,
            onChanged: (_) {},
          ),
          _ProphecyEnablingItem(
            text: localeText.prophecyId['HEART'],
            value: internalStrength,
            onChanged: (_) {},
          ),
          _ProphecyEnablingItem(
            text: localeText.prophecyId['ROOT'],
            value: moodlet,
            onChanged: (_) {},
          ),
          _ProphecyEnablingItem(
            text: localeText.prophecyId['SOLAR'],
            value: ambition,
            onChanged: (_) {},
          ),
          _ProphecyEnablingItem(
            text: localeText.prophecyId['THROAT'],
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
