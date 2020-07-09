import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/models/mutable_text.dart';

class UserInfoField extends StatefulWidget {
  final String hint;
  final Function(String toValidate) validator;
  final TextInputType keyboardType;
  final bool autofocus;
  final int maxLength;
  final MutableText textObject;

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
    _textController = TextEditingController(text: widget.textObject.text);
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
              widget.textObject.text = _textController.text;
            }
          },
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            counterText: "",
            border: _defaultInputBorder(),
            focusedBorder: _defaultInputBorder(color: AppColors.accent),
            enabledBorder: _defaultInputBorder(),
            errorBorder: _defaultInputBorder(color: AppColors.accentDark),
            disabledBorder: _defaultInputBorder(),
            hintText: widget.hint,
          ),
        ),
      );
}

InputBorder _defaultInputBorder({Color color = AppColors.textPrimary}) =>
    UnderlineInputBorder(borderSide: BorderSide(color: color));
