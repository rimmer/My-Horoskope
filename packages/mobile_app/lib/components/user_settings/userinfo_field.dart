import 'package:flutter/material.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:my_prophet/theme/app_colors.dart';

class UserInfoField extends StatefulWidget {
  final String hint;
  final Function(String toValidate) validator;
  final TextInputType keyboardType;
  final bool autofocus;
  final int maxLength;
  final MutableString textObject;

  UserInfoField(
      {Key key,
      @required this.textObject,
      @required this.hint,
      @required this.validator,
      this.keyboardType = TextInputType.text,
      this.autofocus = false,
      @required this.maxLength})
      : super(key: key);

  @override
  _UserInfoFieldState createState() => _UserInfoFieldState();
}

class _UserInfoFieldState extends State<UserInfoField> {
  TextEditingController _textController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _textController = TextEditingController(text: widget.textObject.wrapped);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: TextFormField(
          controller: _textController,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          keyboardAppearance: Brightness.dark,
          autofocus: widget.autofocus,
          maxLength: widget.maxLength,
          maxLengthEnforced: true,
          onChanged: (_) {
            if (_formKey.currentState.validate()) {
              widget.textObject.wrapped = _textController.text;
            }
          },
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 4.0,
              top: 12.0,
              bottom: 8.0,
            ),
            counterText: "",
            border: _defaultInputBorder(),
            focusedBorder: _defaultInputBorder(color: AppColors.accent),
            enabledBorder: _defaultInputBorder(),
            errorBorder: _defaultInputBorder(color: AppColors.accentDark),
            disabledBorder: _defaultInputBorder(),
            hintText: widget.hint,
            labelText: widget.hint,
          ),
        ),
      );
}

InputBorder _defaultInputBorder({Color color = AppColors.textPrimary}) =>
    UnderlineInputBorder(borderSide: BorderSide(color: color));
