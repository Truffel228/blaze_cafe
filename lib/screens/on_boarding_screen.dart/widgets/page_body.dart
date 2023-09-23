import 'package:blaze_cafe/global_widgets/app_button.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageBody extends StatelessWidget {
  const PageBody({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const Spacer(flex: 3),
              SvgPicture.asset(
                imagePath,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              const Spacer(),
              Text(
                title,
                style: context.textTheme.displayLarge,
              ),
              const Spacer(),
              Text(
                subtitle,
                style: context.textTheme.displaySmall,
              ),
              const Spacer(),
              AppButton(text: 'Getting Started', onTap: onTap),
              const Spacer(),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.28,
        )
      ],
    );
  }
}
