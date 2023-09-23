import 'package:blaze_cafe/screens/on_boarding_screen.dart/widgets/page_body.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PageBody(
      imagePath: 'assets/qr.svg',
      title: 'Convenience',
      subtitle:
          'All your favorite foods in one place with new reservation feature',
      onTap: onTap,
    );
  }
}
