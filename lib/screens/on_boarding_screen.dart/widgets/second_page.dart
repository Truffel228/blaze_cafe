import 'package:blaze_cafe/screens/on_boarding_screen.dart/widgets/page_body.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PageBody(
      imagePath: 'assets/pizza.svg',
      title: 'Joyfulness',
      subtitle: 'Enjoy happy moments with friends',
      onTap: onTap,
    );
  }
}
