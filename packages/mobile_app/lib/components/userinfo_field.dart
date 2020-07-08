import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';

class UserInfoField extends StatefulWidget {
  final String hint;
  final Function(String toValidate) validator;
  final TextInputType keyboardType;
  final bool autofocus;
  final _mutableText textObject;
  final EdgeInsetsGeometry padding;

  UserInfoField({
    Key key,
    text = "",
    @required this.hint,
    @required this.validator,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 32),
  })  : textObject = _mutableText(text),
        super(key: key);

  @override
  _UserInfoFieldState createState() => _UserInfoFieldState();
}

class _UserInfoFieldState extends State<UserInfoField> {
  TextEditingController _textController;
  Key _formKey;

  @override
  void initState() {
    _textController = TextEditingController(text: widget.textObject.text);
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: widget.padding,
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: _textController,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            keyboardAppearance: Brightness.dark,
            autofocus: widget.autofocus,
            onEditingComplete: () {
              widget.textObject.text = _textController.text;
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              border: _defaultInputBorder(),
              focusedBorder: _defaultInputBorder(),
              enabledBorder: _defaultInputBorder(),
              errorBorder: _defaultInputBorder(),
              disabledBorder: _defaultInputBorder(),
              hintText: widget.hint,
            ),
          ),
        ),
      );
}

class _mutableText {
  String text;
  _mutableText(this.text);
}

InputBorder _defaultInputBorder({Color color = AppColors.textPrimary}) =>
    UnderlineInputBorder(borderSide: BorderSide(color: color));
