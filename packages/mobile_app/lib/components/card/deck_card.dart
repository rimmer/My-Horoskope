import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const _height = 130.0;
const _width = 64.0;

const _smallCardHeightFull = 100.0;
const _smallCardWidthFull = 64.0;
const _smallCardHeight = 95.0;
const _smallCardWidth = 60.8;

enum DeckCardMode {
  CHOSEN,
  WAS_CHOSEN,
  INTACT,
}

class DeckCard extends StatefulWidget {
  final String icon;
  final DeckCardMode mode;
  DeckCard({this.icon = "star", @required this.mode});

  @override
  _DeckCardState createState() => _DeckCardState();
}

class _DeckCardState extends State<DeckCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (widget.mode == DeckCardMode.CHOSEN)
          ? const EdgeInsets.only(left: 4.0, right: 4.0)
          : const EdgeInsets.all(0.0),
      height: _height,
      width: _width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: (widget.mode == DeckCardMode.CHOSEN) ? 1.0 : 0.0,
              child: SvgPicture.asset(
                "assets/card/light_${widget.icon}.svg",
                height: _smallCardHeight,
                width: _smallCardWidth,
              ),
            ),
          ),
          (widget.mode == DeckCardMode.WAS_CHOSEN)
              ? Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/card/light_${widget.icon}.svg",
                    height: _smallCardHeight,
                    width: _smallCardWidth,
                  ))
              : SizedBox(),
          (widget.mode == DeckCardMode.INTACT)
              ? Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/card/dark_${widget.icon}.svg",
                    height: _smallCardHeightFull,
                    width: _smallCardWidthFull,
                  ))
              : SizedBox(),
        ],
      ),
    );
  }
}
