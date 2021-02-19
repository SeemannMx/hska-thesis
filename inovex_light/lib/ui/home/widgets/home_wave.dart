import 'package:flutter/material.dart';
import 'package:flutter_light/widgets/waves.dart';

class HomeWaves extends StatelessWidget {

  final Size waveSize;

  HomeWaves(this.waveSize);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        height: waveSize.height,
        width: waveSize.width,
        child: Waves(waveSize),
      ),
      clipper: HomeWaveClipper(),
    );
  }
}


class HomeWaveClipper extends CustomClipper<Path> {
  final Path path = Path();

  @override
  Path getClip(Size size) {
    return path
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width,0)
      ..close();
  }

  @override
  bool shouldReclip(HomeWaveClipper old) => false;
}
