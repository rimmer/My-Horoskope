import 'package:flutter/material.dart';
import 'package:my_prophet/services/static_assets.dart';

const _height = 130.0;
const _width = 64.0;

enum SmallCardMode {
  CHOSEN,
  WASCHOSEN,
  INTACT,
}

class SmallCard extends StatefulWidget {
  final String icon;
  final SmallCardMode mode;
  SmallCard({this.icon = "star", @required this.mode});

  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (widget.mode == SmallCardMode.CHOSEN)
          ? EdgeInsets.only(left: 4.0, right: 4.0)
          : EdgeInsets.all(0.0),
      height: _height,
      width: _width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: (widget.mode == SmallCardMode.CHOSEN) ? 1.0 : 0.0,
              child: StaticAsset.svg["light_${widget.icon}"],
            ),
          ),
          (widget.mode == SmallCardMode.WASCHOSEN)
              ? Align(
                  alignment: Alignment.center,
                  child: StaticAsset.svg["light_${widget.icon}"])
              : SizedBox(),
          (widget.mode == SmallCardMode.INTACT)
              ? Align(
                  alignment: Alignment.center,
                  child: StaticAsset.svg["dark_${widget.icon}"])
              : SizedBox(),
        ],
      ),
    );
  }
}
