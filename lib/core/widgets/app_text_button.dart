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
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Text(
        textButton,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
    );
  }
}
