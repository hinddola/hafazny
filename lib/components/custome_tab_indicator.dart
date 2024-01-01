
import 'package:flutter/cupertino.dart';

class CustomTabIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final double tabBarIndicatorSize;
  final double tabBarIndicatorRadius;

  const CustomTabIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
    required this.tabBarIndicatorSize,
    required this.tabBarIndicatorRadius,
  });

  @override
  CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return CustomPainter(
      indicatorHeight: indicatorHeight,
      indicatorColor: indicatorColor,
      tabBarIndicatorSize: tabBarIndicatorSize,
      tabBarIndicatorRadius: tabBarIndicatorRadius,
      onChange: onChanged,
    );
  }
}

class CustomPainter extends BoxPainter {
  final double indicatorHeight;
  final Color indicatorColor;
  final double tabBarIndicatorSize;
  final double tabBarIndicatorRadius;

  CustomPainter({
    required this.indicatorHeight,
    required this.indicatorColor,
    required this.tabBarIndicatorSize,
    required this.tabBarIndicatorRadius,
    VoidCallback? onChange,
  }) : super(onChange);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = Offset(offset.dx + 8,
        offset.dy + configuration.size!.height - 70 /* indicatorHeight */) &
    Size(configuration.size!.width * .8, 2);
    final Paint paint = Paint()
      ..color = indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            rect,
            Radius.circular(
                tabBarIndicatorRadius)) /* fromRectAndCorners(
          rect
          topLeft: Radius.circular(tabBarIndicatorRadius),
          topRight: Radius.circular(tabBarIndicatorRadius),
        ) */
        ,
        paint);
  }
}
