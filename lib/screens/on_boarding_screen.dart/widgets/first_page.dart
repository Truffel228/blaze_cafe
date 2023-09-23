import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((value) => widget.onTap.call());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/logo.svg'),
    );
  }
}
