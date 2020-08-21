import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mutable_wrappers/mutable_wrappers.dart';

class MagicPollPicker extends StatefulWidget {
  final MutableInteger value;
  MagicPollPicker({@required this.value});
  @override
  _MagicPollPickerState createState() => _MagicPollPickerState();
}

class _MagicPollPickerState extends State<MagicPollPicker> {
  @override
  Widget build(BuildContext context) {
    /// depending on value, all circles will be different
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
          children: <Widget>[
            /// 1 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 1;
              }),
              child: SvgPicture.asset("assets/icons/1.svg"),
            ),

            /// 2 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 2;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 3 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 3;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 4 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 4;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 5 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 5;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 6 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 6;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),
          ],
        );

      /// value of 2
      case 2:
        return Row(
          children: <Widget>[
            /// 1 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 1;
              }),
              child: SvgPicture.asset("assets/icons/2.svg"),
            ),

            /// 2 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 2;
              }),
              child: SvgPicture.asset("assets/icons/2.svg"),
            ),

            /// 3 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 3;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 4 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 4;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 5 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 5;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 6 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 6;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),
          ],
        );

      /// value of 3
      case 3:
        return Row(
          children: <Widget>[
            /// 1 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 1;
              }),
              child: SvgPicture.asset("assets/icons/3.svg"),
            ),

            /// 2 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 2;
              }),
              child: SvgPicture.asset("assets/icons/3.svg"),
            ),

            /// 3 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 3;
              }),
              child: SvgPicture.asset("assets/icons/3.svg"),
            ),

            /// 4 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 4;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 5 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 5;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 6 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 6;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),
          ],
        );

      /// value of 4
      case 4:
        return Row(
          children: <Widget>[
            /// 1 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 1;
              }),
              child: SvgPicture.asset("assets/icons/4.svg"),
            ),

            /// 2 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 2;
              }),
              child: SvgPicture.asset("assets/icons/4.svg"),
            ),

            /// 3 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 3;
              }),
              child: SvgPicture.asset("assets/icons/4.svg"),
            ),

            /// 4 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 4;
              }),
              child: SvgPicture.asset("assets/icons/4.svg"),
            ),

            /// 5 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 5;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),

            /// 6 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 6;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),
          ],
        );

      /// value of 5
      case 5:
        return Row(
          children: <Widget>[
            /// 1 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 1;
              }),
              child: SvgPicture.asset("assets/icons/5.svg"),
            ),

            /// 2 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 2;
              }),
              child: SvgPicture.asset("assets/icons/5.svg"),
            ),

            /// 3 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 3;
              }),
              child: SvgPicture.asset("assets/icons/5.svg"),
            ),

            /// 4 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 4;
              }),
              child: SvgPicture.asset("assets/icons/5.svg"),
            ),

            /// 5 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 5;
              }),
              child: SvgPicture.asset("assets/icons/5.svg"),
            ),

            /// 6 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 6;
              }),
              child: SvgPicture.asset("assets/icons/none.svg"),
            ),
          ],
        );

      /// value of 6
      case 6:
        return Row(
          children: <Widget>[
            /// 1 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 1;
              }),
              child: SvgPicture.asset("assets/icons/6.svg"),
            ),

            /// 2 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 2;
              }),
              child: SvgPicture.asset("assets/icons/6.svg"),
            ),

            /// 3 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 3;
              }),
              child: SvgPicture.asset("assets/icons/6.svg"),
            ),

            /// 4 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 4;
              }),
              child: SvgPicture.asset("assets/icons/6.svg"),
            ),

            /// 5 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 5;
              }),
              child: SvgPicture.asset("assets/icons/6.svg"),
            ),

            /// 6 circle
            GestureDetector(
              onDoubleTap: () => setState(() {
                widget.value.wrapped = 6;
              }),
              child: SvgPicture.asset("assets/icons/6.svg"),
            ),
          ],
        );
    }
  }
}
