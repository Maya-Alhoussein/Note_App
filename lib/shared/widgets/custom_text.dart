import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final TextAlign? alignment;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.alignment,
    this.overflow,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize ?? 24.w,
        color: color ?? Colors.black,
        overflow: overflow,
      ),
    );
  }
}
