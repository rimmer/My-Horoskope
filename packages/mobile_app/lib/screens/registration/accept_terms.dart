import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/components/accept_terms_text.dart';

const URL_PRIVACY_POLICY = "https://rimmer.github.io/my_prophet/privacy.html";
const URL_USER_AGREEMENT = "https://rimmer.github.io/my_prophet/privacy.html";

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
              child: GestureDetector(
                onTap: () => setState(
                  () => widget.terms.wrapped = !widget.terms.wrapped,
                ),
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
                      child: acceptTermsText(lang.termsAccept.capitalize(),
                          isController: true),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: FlatButton(
                onPressed: () => launch(URL_USER_AGREEMENT),
                child: acceptTermsText(
                  lang.userAgreement,
                ),
              ),
            ),
            Flexible(
              child: FlatButton(
                onPressed: () => launch(URL_PRIVACY_POLICY),
                child: acceptTermsText(
                  lang.privacyPolicy,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
