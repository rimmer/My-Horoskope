import 'package:flutter/material.dart';
import 'package:my_prophet/services/static_assets.dart';

const _height = 130.0;
const _width = 64.0;

enum TarrotCardMode {
  CHOSEN,
  WAS_CHOSEN,
  INTACT,
}

class TarrotCard extends StatefulWidget {
  final String icon;
  final TarrotCardMode mode;
  TarrotCard({this.icon = "star", @required this.mode});

  @override
  _TarrotCardState createState() => _TarrotCardState();
}

class _TarrotCardState extends State<TarrotCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (widget.mode == TarrotCardMode.CHOSEN)
          ? EdgeInsets.only(left: 4.0, right: 4.0)
          : EdgeInsets.all(0.0),
      height: _height,
      width: _width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: (widget.mode == TarrotCardMode.CHOSEN) ? 1.0 : 0.0,
              child: StaticAsset.svg["light_${widget.icon}"],
            ),
          ),
          (widget.mode == TarrotCardMode.WAS_CHOSEN)
              ? Align(
                  alignment: Alignment.center,
                  child: StaticAsset.svg["light_${widget.icon}"])
              : SizedBox(),
          (widget.mode == TarrotCardMode.INTACT)
              ? Align(
                  alignment: Alignment.center,
                  child: StaticAsset.svg["dark_${widget.icon}"])
              : SizedBox(),
        ],
      ),
    );
  }
}
