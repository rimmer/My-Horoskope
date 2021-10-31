import '../common.dart';

class CardCarousel extends StatefulWidget {
  const CardCarousel({@required this.children});
  final List<Widget> children;

  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  int _indexInCarousel = 0;

  int get _maxAvaibleIndexInCarousel => widget.children.length - 1;
  static const int _minAvaibleIndexInCarousel = 0;
  static const _iconSize = 26.0;
  String _numberToShowInUi(int index) => (index + 1).toString();

  void _nextItem() {
    if (_indexInCarousel == _maxAvaibleIndexInCarousel)
      _indexInCarousel = _minAvaibleIndexInCarousel;
    else
      ++_indexInCarousel;
    setState(() {});
  }

  void _previousItem() {
    if (_indexInCarousel == _minAvaibleIndexInCarousel)
      _indexInCarousel = _maxAvaibleIndexInCarousel;
    else
      --_indexInCarousel;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Widget currentItemToShow = widget.children[_indexInCarousel];
    String label = _numberToShowInUi(_indexInCarousel) + '/' + _numberToShowInUi(_maxAvaibleIndexInCarousel);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 28.0,
            ),
            child: currentItemToShow,
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Text(
            label,
            style: AppTextStyle.cardCarouselLabel,
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: IconButton(
              onPressed: _previousItem,
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: _iconSize,
                color: AppColors.textPrimary,
              )),
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: IconButton(
              onPressed: _nextItem,
              icon: const Icon(
                Icons.keyboard_arrow_right,
                size: _iconSize,
                color: AppColors.textPrimary,
              )),
        ),
      ],
    );
  }
}
