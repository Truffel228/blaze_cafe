import 'package:blaze_cafe/global_widgets/back_arrow_button.dart';
import 'package:blaze_cafe/screens/review_screen/widgets/star_bar_with_icon.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            'assets/logo.svg',
            height: 80,
          ),
          const Spacer(),
          Text(
            'Your Dishes',
            style: context.textTheme.titleLarge?.copyWith(fontSize: 30),
          ),
          const Spacer(),
          Text(
            'How was your whole experience?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          const Spacer(),
          StarBarWithIcon(),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
