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
            Expanded(
              child: SvgPicture.asset("assets/widget/magic_poll/oneCircle.svg"),
            ),

            /// 2 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 2;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 3 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 3;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 4 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 4;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 5 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 5;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 6 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 6;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),
          ],
        );

      /// value of 2
      case 2:
        return Row(
          children: <Widget>[
            /// 1 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 1;
                }),
                child:
                    SvgPicture.asset("assets/widget/magic_poll/twoCircles.svg"),
              ),
            ),

            /// 2 circle
            Expanded(
              child:
                  SvgPicture.asset("assets/widget/magic_poll/twoCircles.svg"),
            ),

            /// 3 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 3;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 4 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 4;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 5 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 5;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 6 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 6;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),
          ],
        );

      /// value of 3
      case 3:
        return Row(
          children: <Widget>[
            /// 1 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 1;
                }),
                child: SvgPicture.asset(
                    "assets/widget/magic_poll/threeCircles.svg"),
              ),
            ),

            /// 2 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 2;
                }),
                child: SvgPicture.asset(
                    "assets/widget/magic_poll/threeCircles.svg"),
              ),
            ),

            /// 3 circle
            Expanded(
              child:
                  SvgPicture.asset("assets/widget/magic_poll/threeCircles.svg"),
            ),

            /// 4 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 4;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 5 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 5;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 6 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 6;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),
          ],
        );

      /// value of 4
      case 4:
        return Row(
          children: <Widget>[
            /// 1 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 1;
                }),
                child: SvgPicture.asset(
                    "assets/widget/magic_poll/fourCircles.svg"),
              ),
            ),

            /// 2 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 2;
                }),
                child: SvgPicture.asset(
                    "assets/widget/magic_poll/fourCircles.svg"),
              ),
            ),

            /// 3 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 3;
                }),
                child: SvgPicture.asset(
                    "assets/widget/magic_poll/fourCircles.svg"),
              ),
            ),

            /// 4 circle
            Expanded(
              child:
                  SvgPicture.asset("assets/widget/magic_poll/fourCircles.svg"),
            ),

            /// 5 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 5;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),

            /// 6 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 6;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),
          ],
        );

      /// value of 5
      case 5:
        return Row(
          children: <Widget>[
            /// 1 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 1;
                }),
                child: SvgPicture.asset(
                    "assets/widget/magic_poll/fiveCircles.svg"),
              ),
            ),

            /// 2 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 2;
                }),
                child: SvgPicture.asset(
                    "assets/widget/magic_poll/fiveCircles.svg"),
              ),
            ),

            /// 3 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 3;
                }),
                child: SvgPicture.asset(
                    "assets/widget/magic_poll/fiveCircles.svg"),
              ),
            ),

            /// 4 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 4;
                }),
                child: SvgPicture.asset(
                    "assets/widget/magic_poll/fiveCircles.svg"),
              ),
            ),

            /// 5 circle
            Expanded(
              child:
                  SvgPicture.asset("assets/widget/magic_poll/fiveCircles.svg"),
            ),

            /// 6 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 6;
                }),
                child: SvgPicture.asset("assets/widget/magic_poll/none.svg"),
              ),
            ),
          ],
        );

      /// value of 6
      case 6:
        return Row(
          children: <Widget>[
            /// 1 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 1;
                }),
                child:
                    SvgPicture.asset("assets/widget/magic_poll/sixCircles.svg"),
              ),
            ),

            /// 2 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 2;
                }),
                child:
                    SvgPicture.asset("assets/widget/magic_poll/sixCircles.svg"),
              ),
            ),

            /// 3 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 3;
                }),
                child:
                    SvgPicture.asset("assets/widget/magic_poll/sixCircles.svg"),
              ),
            ),

            /// 4 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 4;
                }),
                child:
                    SvgPicture.asset("assets/widget/magic_poll/sixCircles.svg"),
              ),
            ),

            /// 5 circle
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.value.wrapped = 5;
                }),
                child:
                    SvgPicture.asset("assets/widget/magic_poll/sixCircles.svg"),
              ),
            ),

            /// 6 circle
            Expanded(
              child:
                  SvgPicture.asset("assets/widget/magic_poll/sixCircles.svg"),
            ),
          ],
        );
    }
  }
}
