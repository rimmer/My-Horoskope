import 'package:flutter/material.dart';
import 'package:mutable_wrappers/mutable_wrappers.dart';

import 'package:language/language.dart';
import 'package:app/theme/app_colors.dart';
import 'magic_poll.dart';
import 'gradient_flatbutton.dart';

class YesterdayPollSimple extends StatefulWidget {
  MutableInteger mood;
  YesterdayPollSimple({@required this.mood});
  @override
  _YesterdayPollSimpleState createState() => _YesterdayPollSimpleState();
}

class _YesterdayPollSimpleState extends State<YesterdayPollSimple> {
  @override
  Widget build(BuildContext context) {
    //

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${lang.rateYourYesterday.capitalize()}...",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),

          /// MOOD poll
          Text(
            lang.mood.capitalize(),
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          MagicPollPicker(value: widget.mood),
        ],
      ),
    );
  }
}
