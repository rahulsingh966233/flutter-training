
import 'package:flutter/cupertino.dart';

class TriangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  TriangleTabIndicator({@required Color color})
      : _painter = DrawTriangle(color);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class DrawTriangle extends BoxPainter {
  Paint _paint;

  DrawTriangle(Color color) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset triangleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height);
    var path = Path();
    path.moveTo(triangleOffset.dx, triangleOffset.dy);
    path.quadraticBezierTo(triangleOffset.dx + 10, triangleOffset.dy + 1,
        triangleOffset.dx + 10, triangleOffset.dy + 10);
    path.quadraticBezierTo(triangleOffset.dx + 10, triangleOffset.dy + 1,
        triangleOffset.dx + 20, triangleOffset.dy);
    path.close();
    canvas.drawPath(path, _paint);
  }
}