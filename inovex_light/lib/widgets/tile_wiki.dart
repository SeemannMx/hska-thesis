import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/widgets/clipper/wiki_tile_clipper.dart';

class WikiTileHome extends StatelessWidget {
  final Size _size;
  final double corner;
  final Widget widget;
  final clipper;

  WikiTileHome(this._size, this.corner, this.widget, [this.clipper]);

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
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [inovexDarkBlue, inovexBlue.shade700])
          ),
        ),
        clipper: (this.clipper != null) ? clipper : WikiTileClipper(corner),
      ),
    );
  }
}
