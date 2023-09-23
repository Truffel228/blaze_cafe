import 'package:blaze_cafe/screens/on_boarding_screen.dart/widgets/page_body.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PageBody(
      imagePath: 'assets/fan.svg',
      title: 'Enjoy&Reviews',
      subtitle: 'Enjoy all your great food, review and share your experience.',
      onTap: onTap,
    );
  }
}
