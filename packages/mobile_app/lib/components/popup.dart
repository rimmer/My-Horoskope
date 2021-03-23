import 'package:flutter/material.dart';
import 'package:my_prophet/theme/app_colors.dart';
import 'package:my_prophet/theme/app_text_style.dart';

Future<void> showOverCurrentScreen({
  @required BuildContext context,
  @required Widget child,
}) =>
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        child: child,
        insetPadding: EdgeInsets.all(0),
      ),
    );

class SimpleTransperentScreen extends StatefulWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;
  const SimpleTransperentScreen({
    Key key,
    this.title,
    @required this.body,
    this.actions = const [],
  }) : super(key: key);

  _SimpleTransperentScreenState createState() =>
      _SimpleTransperentScreenState();
}

class _SimpleTransperentScreenState extends State<SimpleTransperentScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _popupCreationController;
  Animation<Offset> _popupCreation;

  @override
  void initState() {
    _popupCreationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 200,
        ))
      ..forward();

    _popupCreation = Tween<Offset>(
      begin: Offset(
        -2.0,
        0.0,
      ),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _popupCreationController,
      curve: Curves.ease,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _popupCreationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Builder(
      builder: (_) => SlideTransition(
        position: _popupCreation,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.95),
            borderRadius: BorderRadius.circular(8.0),
          ),
          width: width * 3 / 4,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              (widget.title != null)
                  ? Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      height: 44,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 20),
                          Text(widget.title, style: AppTextStyle.popupTitle),
                        ],
                      ),
                    )
                  : SizedBox(),
              widget.body,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.actions,
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
