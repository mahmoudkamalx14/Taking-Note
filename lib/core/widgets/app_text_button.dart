import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.textButton,
    required this.onPressed,
  });

  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: Theme.of(context).textButtonTheme.style,
      child: Text(
        textButton,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
