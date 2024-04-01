import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String headerImage;
  const HeaderImage({Key? key, required this.headerImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image.network(
        headerImage,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
