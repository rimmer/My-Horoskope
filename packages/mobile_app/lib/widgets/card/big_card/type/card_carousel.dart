import '../common.dart';

const _iconSize = 26.0;
const _widthOfArrowButtonsToNotOverflow = 96.0;
const _flexItem = 84;
const _flexPanel = 16;

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
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: _CardCarouselItem(currentItemToShow),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _CardCarouselBottomPanel(
            numbers: label,
            onPrevious: _previousItem,
            onNext: _nextItem,
          ),
        ),
      ],
    );
  }
}

class _CardCarouselItem extends StatelessWidget {
  const _CardCarouselItem(this.item);
  final Widget item;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Flexible(
            flex: _flexItem,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: item,
              ),
            ),
          ),
          Flexible(flex: _flexPanel, child: SizedBox()),
        ],
      );
}

class _CardCarouselBottomPanel extends StatelessWidget {
  const _CardCarouselBottomPanel({
    @required this.numbers,
    @required this.onPrevious,
    @required this.onNext,
  }) : super();

  final String numbers;
  final Function onPrevious;
  final Function onNext;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _CardCarouselElementBackground(
            child: Text(
              numbers,
              style: AppTextStyle.cardCarouselLabel,
            ),
          ),
          Expanded(child: SizedBox()),
          SizedBox(
            width: _widthOfArrowButtonsToNotOverflow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onPrevious,
                  icon: const _CarouselIconLeft(),
                ),
                IconButton(
                  onPressed: onNext,
                  icon: const _CarouselIconRight(),
                ),
              ],
            ),
          )
        ],
      );
}

class _CardCarouselElementBackground extends StatelessWidget {
  const _CardCarouselElementBackground({@required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: child),
      height: 30.0,
      width: 50.0,
      color: Color.fromRGBO(255, 255, 255, 0.3),
    );
  }
}

class _CarouselIconLeft extends StatelessWidget {
  const _CarouselIconLeft();

  @override
  Widget build(BuildContext context) => const _CardCarouselElementBackground(
          child: const Icon(
        Icons.keyboard_arrow_left,
        size: _iconSize,
        color: AppColors.textPrimary,
      ));
}

class _CarouselIconRight extends StatelessWidget {
  const _CarouselIconRight();

  @override
  Widget build(BuildContext context) => const _CardCarouselElementBackground(
          child: const Icon(
        Icons.keyboard_arrow_right,
        size: _iconSize,
        color: AppColors.textPrimary,
      ));
}
