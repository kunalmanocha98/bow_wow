import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class AppCircleAvatar extends StatelessWidget{
  final String imageUrl;
  const AppCircleAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover
        )
      ),
    );
  }
}