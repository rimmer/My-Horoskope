import 'package:flutter/material.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';

class MagicCheckbox extends StatefulWidget {
  final MutableBool value;
  final Function(bool value) onChanged;
  MagicCheckbox({@required this.value, @required this.onChanged});
  _MagicCheckboxState createState() => _MagicCheckboxState();
}

class _MagicCheckboxState extends State<MagicCheckbox> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          widget.value.wrapped = !widget.value.wrapped;
          widget.onChanged(widget.value.wrapped);
        });
      },
      child: (widget.value.wrapped)
          ? Image(image: AssetImage('assets/widget/magic_checkbox_true.png'))
          : Image(image: AssetImage('assets/widget/magic_checkbox_false.png')),
    );
  }
}
