import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/widgets/clipper/audit_tile_clipper.dart';

class AuditTileHome extends StatelessWidget {
  final Size _size;
  final double corner;
  final Widget widget;

  AuditTileHome(this._size, this.corner, this.widget);

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
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [inovexBlue.shade700, inovexDarkBlue])
          ),
        ),
        clipper: AuditTileClipper(corner),
      ),
    );
  }
}
