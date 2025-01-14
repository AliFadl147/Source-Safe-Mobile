import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.image,
    required this.color,
    required this.padding,
    this.isColor = true,
    this.fit,
    required this.width,
  });

  final String image;
  final Color? color;
  final double padding;
  final bool? isColor;
  final BoxFit? fit;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SvgPicture.asset(
        image,
        width: width,
        colorFilter:
            isColor == true ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}
