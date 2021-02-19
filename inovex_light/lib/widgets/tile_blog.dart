import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/widgets/clipper/blog_tile_clipper.dart';

class BlogTileHome extends StatelessWidget {
  final Size _size;
  final double corner;
  final Widget widget;

  BlogTileHome(this._size, this.corner, this.widget);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size.width,
      height: _size.height,
      child: ClipPath(
        child: Container(
          child: widget,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [inovexBlue.shade700, inovexDarkBlue])
          ),
        ),
        clipper: BlogTileClipper(corner),
      ),
    );
  }
}
