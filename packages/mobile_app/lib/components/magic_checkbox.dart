import 'package:flutter/material.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:my_prophet/services/static_assets.dart';

class MagicCheckbox extends StatefulWidget {
  final MutableBool value;
  final Function(bool value) onChanged;
  MagicCheckbox({@required this.value, @required this.onChanged});
  _MagicCheckboxState createState() => _MagicCheckboxState();
}

class _MagicCheckboxState extends State<MagicCheckbox> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          widget.value.wrapped = !widget.value.wrapped;
          widget.onChanged(widget.value.wrapped);
        });
      },
      child: (widget.value.wrapped)
          ? Image(image: StaticAsset.rust["magic_checkbox_true"])
          : Image(image: StaticAsset.rust["magic_checkbox_false"]),
    );
  }
}
