import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.width,
  });

  final String textButton;
  final VoidCallback onPressed;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 120.w,
        height: 50.h,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: ShapeDecoration(
          color: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
