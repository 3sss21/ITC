import 'package:cashback_app/commons/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCachedNetworkImageWidget extends StatelessWidget {
  const CustomCachedNetworkImageWidget({
    Key? key,
    this.isRadius = true,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.radius,
  }) : super(key: key);
  final bool isRadius;
  final String? imageUrl;
  final double? width;
  final double? height;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ??
          'https://pbs.twimg.com/profile_images/932599989964099584/GKV4NGiU_400x400.jpg',
      imageBuilder: (context, imageProvider) => Container(
        width: width!,
        height: height!,
        decoration: BoxDecoration(
          borderRadius: isRadius ? radius : null,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(
        strokeWidth: 3.w,
        color: ThemeHelper.green100,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
