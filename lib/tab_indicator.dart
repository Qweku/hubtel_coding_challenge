import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      this,
      onChanged!,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(
    this.decoration,
    VoidCallback onChanged,
  )   : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    double indicatorHeight = 5.h;

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    final Rect rect = Offset(
            offset.dx, (configuration.size!.height / 2) - indicatorHeight / 2) &
        Size(configuration.size!.width, indicatorHeight);
    final Paint paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(5)), paint);
    
  }
}


class GradientTabIndicator extends Decoration {
  @override
  _CustomPainting createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainting(
      this,
      onChanged!,
    );
  }
}

class _CustomPainting extends BoxPainter {
  final GradientTabIndicator decoration;

  _CustomPainting(
    this.decoration,
    VoidCallback onChanged,
  )   : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width   of the tab.
    final Rect rect = Offset(
            offset.dx, offset.dy /* (configuration.size!.height / 2) - indicatorHeight / 2 */) &
        Size(configuration.size!.width, configuration.size!.height  /* indicatorHeight */);
    final Paint paint = Paint();
    paint.shader = gradientAlt .createShader(rect);
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(6)), paint);
    // paint.color = AppColors.orange;
    // paint.style = PaintingStyle.stroke;
    // paint.strokeWidth = 3;
    // canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(6)), paint);
    // paintBorder(canvas, rect);
  }
   static const LinearGradient gradientAlt = LinearGradient(
    end: Alignment(1.00, 0.08),
    begin: Alignment(-1, -0.08),
    colors: [Colors.red, Colors.green],
  );
}

