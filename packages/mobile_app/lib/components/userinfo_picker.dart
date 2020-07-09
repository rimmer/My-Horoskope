import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/models/mutable_int.dart';

class UserInfoPicker extends StatefulWidget {
  final Map<int, String> items;
  final MutableInteger indexObject;

  UserInfoPicker({
    @required this.items,
    @required this.indexObject,
  });

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
          widget.indexObject.num = value;
        });
      },
      value: widget.indexObject.num,
      isExpanded: true,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 32,
      dropdownColor: AppColors.primaryDark,
    );
  }
}
