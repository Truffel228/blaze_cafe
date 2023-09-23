import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_review/in_app_review.dart';

class StarBarWithIcon extends StatefulWidget {
  const StarBarWithIcon({super.key});

  @override
  State<StarBarWithIcon> createState() => _StarBarWithIconState();
}

class _StarBarWithIconState extends State<StarBarWithIcon> {
  var _stars = 0;

  final inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('assets/dice/dice_$_stars.svg', height: 180),
        const SizedBox(height: 24),
        Row(
          children: [
            const Spacer(flex: 5),
            StarItem(
              onTap: () => _onStarTap(1),
              isFull: _stars >= 1,
            ),
            const Spacer(),
            StarItem(
              onTap: () => _onStarTap(2),
              isFull: _stars >= 2,
            ),
            const Spacer(),
            StarItem(
              onTap: () => _onStarTap(3),
              isFull: _stars >= 3,
            ),
            const Spacer(),
            StarItem(
              onTap: () => _onStarTap(4),
              isFull: _stars >= 4,
            ),
            const Spacer(),
            StarItem(
              onTap: () => _onStarTap(5),
              isFull: _stars >= 5,
            ),
            const Spacer(flex: 5),
          ],
        ),
      ],
    );
  }

  void _onStarTap(int i) {
    setState(() {
      _stars = i;
    });
    if (i >= 4) {
      inAppReview.openStoreListing(appStoreId: '6467491271');
    }
  }
}

class StarItem extends StatelessWidget {
  const StarItem({
    super.key,
    required this.onTap,
    required this.isFull,
  });

  final VoidCallback onTap;
  final bool isFull;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: SvgPicture.asset(
        isFull ? 'assets/star_full.svg' : 'assets/star_empty.svg',
        colorFilter: ColorFilter.mode(
          context.theme.primaryColor,
          BlendMode.srcIn,
        ),
        height: 40,
      ),
    );
  }
}
