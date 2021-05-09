import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:text/text.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';
import 'package:my_prophet/components/accept_terms_text.dart';
import 'package:my_prophet/components/magic_checkbox.dart';

class AcceptTermsRow extends StatefulWidget {
  final MutableBool terms;
  AcceptTermsRow({Key key, @required this.terms}) : super(key: key);

  @override
  _AcceptTermsRowState createState() => _AcceptTermsRowState();
}

class _AcceptTermsRowState extends State<AcceptTermsRow> {
  @override
  Widget build(BuildContext context) {
    final rightColumnItems = <Widget>[
      Flexible(
          child: AcceptTermsText(localeText.termsAccept.capitalize(),
              isController: true)),
      //
      Flexible(
        child: TextButton(
          onPressed: () => launch(URL_USER_AGREEMENT),
          child: AcceptTermsText(
            localeText.termsUserAgreement,
          ),
        ),
      ),
      Flexible(
        child: TextButton(
          onPressed: () => launch(URL_PRIVACY_POLICY),
          child: AcceptTermsText(
            localeText.termsPrivacyPolicy,
          ),
        ),
      ),
    ];

    return Container(
      margin: const EdgeInsets.only(top: 32.0, bottom: 8.0),
      height: 48,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          MagicCheckbox(
            value: widget.terms,
            onChanged: (_) {},
          ),
          const SizedBox(
            width: 16.0,
          ),
          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: rightColumnItems,
          ),
        ],
      ),
    );
  }
}
