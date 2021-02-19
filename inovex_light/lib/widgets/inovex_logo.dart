import 'package:flutter/material.dart';
import 'package:flutter_light/utils/custom_colors.dart';
import 'package:flutter_light/widgets/clipper/inovex_logo_clipper.dart';

class InovexLogo extends StatelessWidget {
  final Color splashColorLogo;
  final Color colorLogo;
  final int progressIndicator;
  final Size _size;

  const InovexLogo(this._size,
      [this.splashColorLogo = inovexBlue,
      this.progressIndicator = 4,
      this.colorLogo = inovexBlue]);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size.width,
      height: _size.width,
      child:   ClipPath(
        child: Container(
          color: progressIndicator >= 2 ? splashColorLogo : colorLogo,
        ),
        clipper: InovexLogoClipper(),
      ),
    );
  }
}

