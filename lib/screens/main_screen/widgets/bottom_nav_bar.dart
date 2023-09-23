import 'package:blaze_cafe/screens/main_screen/widgets/bottom_nav_bar_item.dart';
import 'package:blaze_cafe/utils/context_ext.dart';
import 'package:blaze_cafe/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onItemTap,
    required this.onQrTap,
    required this.currentIndex,
  });

  final void Function(int) onItemTap;
  final VoidCallback onQrTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final _clipper = BottomNavBarClipper();

    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: _clipper,
        shadow: const Shadow(
          offset: Offset(0, -2),
          color: AppTheme.lightGrey,
          blurRadius: 8,
        ),
      ),
      child: ClipPath(
        clipper: _clipper,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: 90,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  children: [
                    const Spacer(),
                    BottomNavBarItem(
                      selected: currentIndex == 0,
                      onTap: () => onItemTap(0),
                      imagePath: 'assets/home.svg',
                      title: 'Home',
                    ),
                    const Spacer(flex: 2),
                    BottomNavBarItem(
                      selected: currentIndex == 1,
                      onTap: () => onItemTap(1),
                      imagePath: 'assets/hot_deal.svg',
                      title: 'Hot Deal',
                    ),
                    const Spacer(flex: 4),
                    BottomNavBarItem(
                      selected: currentIndex == 2,
                      onTap: () => onItemTap(2),
                      imagePath: 'assets/rewards.svg',
                      title: 'Rewards',
                    ),
                    const Spacer(flex: 2),
                    BottomNavBarItem(
                      selected: currentIndex == 3,
                      onTap: () => onItemTap(3),
                      imagePath: 'assets/review.svg',
                      title: 'Review',
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 36),
                child: GestureDetector(
                  onTap: onQrTap,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.theme.primaryColor,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          color: AppTheme.lightGrey,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      'assets/qr_icon.svg',
                      width: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    final width = size.width;
    final height = size.height;

    path
      ..moveTo(0, height * 0.7)
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, height * 0.7)
      ..quadraticBezierTo(width, height * 0.3, width * 0.9, height * 0.35)
      ..lineTo(width * 0.59, height * 0.35)
      ..quadraticBezierTo(
        width * 0.56,
        height * 0.35,
        width * 0.543,
        height * 0.2,
      )
      ..quadraticBezierTo(width * 0.5, 0, width * 0.457, height * 0.2)
      ..quadraticBezierTo(
          width * 0.44, height * 0.35, width * 0.41, height * 0.35)
      ..lineTo(width * 0.1, height * 0.35)
      ..quadraticBezierTo(0, height * 0.35, 0, height * 0.7);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
