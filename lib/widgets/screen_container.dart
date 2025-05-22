import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child; 
  const ScreenContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: child,
    );
  }
}

