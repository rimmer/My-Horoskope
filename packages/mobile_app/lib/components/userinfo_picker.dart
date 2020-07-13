import 'package:flutter/material.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:app/theme/app_colors.dart';

class UserInfoPicker extends StatefulWidget {
  final Map<int, String> items;
  final MutableInteger indexObject;

  UserInfoPicker({
    Key key,
    @required this.items,
    @required this.indexObject,
  }) : super(key: key);

  @override
  _UserInfoPickerState createState() => _UserInfoPickerState();
}

class _UserInfoPickerState extends State<UserInfoPicker> {
  List<DropdownMenuItem> items = [];

  @override
  void initState() {
    widget.items.forEach((index, text) {
      items.add(
        DropdownMenuItem(
          value: index,
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.textDisabled,
              fontSize: 14,
            ),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: items,
      onChanged: (value) {
        setState(() {
          widget.indexObject.wrapped = value;
        });
      },
      value: widget.indexObject.wrapped,
      isExpanded: true,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 32,
      dropdownColor: AppColors.primaryDark,
    );
  }
}
