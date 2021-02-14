import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mutable_wrappers/mutable_wrappers.dart';

/// it is faster to call empty function
/// then check if function == null
/// for onTap method
void _dummyFunc() {}

class MagicPollPicker extends StatefulWidget {
  final Function onTap;
  final MutableInteger value;
  MagicPollPicker({@required this.value, this.onTap = _dummyFunc});
  @override
  _MagicPollPickerState createState() => _MagicPollPickerState();
}

class _MagicPollPickerState extends State<MagicPollPicker> {
  @override
  Widget build(BuildContext context) {
    /// depending on value, all stars will be different
    /// not mine idea, it is from figma
    ///
    /// ! ListBuilder is not used because of
    /// better productivity of fixed row
    /// it looks weird, but, it is faster
    /// "trust me, I am $PROFFESION_NAME"
    switch (widget.value.wrapped) {

      /// value of 1
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// 1 star
            SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),

            /// 2 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 2;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 3 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 3;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 4 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 4;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 5 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 5;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 6 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 6;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),
          ],
        );

      /// value of 2
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// 1 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 1;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 2 star
            SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),

            /// 3 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 3;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 4 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 4;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 5 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 5;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 6 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 6;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),
          ],
        );

      /// value of 3
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// 1 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 1;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 2 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 2;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 3 star
            SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),

            /// 4 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 4;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 5 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 5;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 6 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 6;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),
          ],
        );

      /// value of 4
      case 4:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// 1 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 1;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 2 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 2;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 3 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 3;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 4 star
            SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),

            /// 5 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 5;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),

            /// 6 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 6;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),
          ],
        );

      /// value of 5
      case 5:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// 1 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 1;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 2 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 2;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 3 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 3;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 4 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 4;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 5 star
            SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),

            /// 6 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 6;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_off.svg"),
            ),
          ],
        );

      /// value of 6
      case 6:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// 1 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 1;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 2 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 2;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 3 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 3;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 4 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 4;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 5 star
            GestureDetector(
              onTap: () => setState(() {
                widget.value.wrapped = 5;
                widget.onTap();
              }),
              child: SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
            ),

            /// 6 star
            SvgPicture.asset("assets/widget/magic_poll/star_on.svg"),
          ],
        );
    }
  }
}
