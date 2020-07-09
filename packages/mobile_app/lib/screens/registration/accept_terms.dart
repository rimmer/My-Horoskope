import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';

class AcceptTermsRow extends StatefulWidget {
  final MutableBool terms;
  AcceptTermsRow({Key key, @required this.terms}) : super(key: key);

  @override
  _AcceptTermsRowState createState() => _AcceptTermsRowState();
}

class _AcceptTermsRowState extends State<AcceptTermsRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        height: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Checkbox(
                      activeColor: AppColors.accentDark,
                      value: widget.terms.wrapped,
                      onChanged: (accepted) => setState(
                        () => widget.terms.wrapped = accepted,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      lang.termsAccept,
                      style: TextStyle(
                          fontSize: 12, color: AppColors.textDisabled),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: FlatButton(
                onPressed: () =>
                    launch("https://rimmer.github.io/my_prophet/privacy.html"),
                child: Text(
                  lang.userAgreement,
                  style:
                      TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
              ),
            ),
            Flexible(
              child: FlatButton(
                onPressed: () =>
                    launch("https://rimmer.github.io/my_prophet/privacy.html"),
                child: Text(
                  lang.privacyPolicy,
                  style:
                      TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
