import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const CustomImage(
      {super.key, required this.imageUrl, this.width = 30, this.height = 30});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: width,
      height: height,
      imageUrl: "https:$imageUrl",
      errorWidget: (context, url, error) => Container(),
    );
  }
}
