import 'package:flutter/material.dart';
import 'package:my_horoskope/common/card/card_image_widget.dart';
import 'package:my_horoskope/common/precache_assets.dart';

const _height = 130.0;
const _width = 64.0;

enum DeckCardMode {
  CHOSEN,
  WAS_CHOSEN,
  INTACT,
}

class DeckCardInner extends StatefulWidget {
  const DeckCardInner({
    this.icon = "star",
    @required this.mode,
  });

  final String icon;
  final DeckCardMode mode;

  @override
  _DeckCardInnerState createState() => _DeckCardInnerState();
}

class _DeckCardInnerState extends State<DeckCardInner> {
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
              child: CardImageWidget(PrecacheAssets.svg["light_${widget.icon}"]),
            ),
          ),
          (widget.mode == DeckCardMode.WAS_CHOSEN)
              ? Align(
                  alignment: Alignment.center,
                  child: CardImageWidget(PrecacheAssets.svg["light_${widget.icon}"]),
                )
              : SizedBox(),
          (widget.mode == DeckCardMode.INTACT)
              ? Align(
                  alignment: Alignment.center,
                  child: CardImageWidget(PrecacheAssets.svg["dark_${widget.icon}"]),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
