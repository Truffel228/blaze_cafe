import 'package:blaze_cafe/global_widgets/app_button.dart';
import 'package:blaze_cafe/router.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

export 'order_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/logo.svg',
              height: 80,
            ),
            const Spacer(),
            Text(
              'Scan To Order',
              style: context.textTheme.titleLarge,
            ),
            const Spacer(flex: 2),
            SvgPicture.asset(
              'assets/qr_code.svg',
              height: 200,
            ),
            const Spacer(flex: 2),
            AppButton(
              text: 'SCAN',
              onTap: () => context.pushNamed(AppRouter.homeOrder),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
